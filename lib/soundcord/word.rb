require 'soundcord/phonetizable'

class SoundCord::Word < SoundCord::Phonetizable

  def to_sound
    self.homophone ||= self.phonetize!
  end

protected
  def phonetize!
    super

    self.homophone = original.downcase

    SoundCord.lang_yml.each do |key, values|
      if key == 'terminations'
        process_group! values, :terminations => true
      elsif key == 'initiations'
        process_group! values, :initiations => true
      elsif key == 'follow_ups'
        process_follow_ups! values, SoundCord.options
      elsif key == 'second_followed'
        process_second_followed! values, SoundCord.options
      elsif key == 'vowels_pronunciation_insignificance'
        process_vowels_pronunciation_insignificance! values, SoundCord.options
      elsif !key.include? 'duplicate'
        process_group! values, SoundCord.options
      end
    end

    remove_duplicity! :duplicate_exceptions => (SoundCord.lang_yml['duplicate_exceptions'])

    self.homophone.upcase
  end

  def remove_duplicity!(options)
    options[:duplicate_exceptions] = [] unless options[:duplicate_exceptions]

    self.homophone = self.homophone.split(//).inject('') do |s, n|
      last_s_char = s[s.length-1..s.length-1]
      s + ((last_s_char === n and
            !options[:duplicate_exceptions].include?(n)) ? '' : n )
    end
  end

  def process_group!(group, options)
    group.each do |key, values|
      if values
        simple_replace! key, values, options
      else
        simple_replace! '', key, options
      end
    end
  end

  def process_follow_ups!(group, options = {})
    group.each do |key, prefixes|
      prefixes.each do |prefix, sufixes|
        regexp = mount_follow_up_regexp prefix, sufixes
        self.homophone.gsub! regexp, key
      end
    end
  end

  def process_second_followed!(group, options = {})
    group.each do |key, prefixes|
      prefixes.each do |prefix, sufixes|
        regexp = mount_second_followed_by_regexp prefix, sufixes
        self.homophone =~ regexp
        replacing = ($1 ? $1 : '') + key
        self.homophone.gsub! regexp, replacing
      end
    end
  end

  def process_vowels_pronunciation_insignificance!(group, options = {})
    group.each do |key, value|
      regexp = mount_vowels_pronunciation_insignificance_regexp key
      self.homophone =~ regexp
      self.homophone.gsub! regexp, ($1 || '')
    end
  end

  def process_followed_by_consonant_regexp!(group)
    group.each do |key, value|
      regexp = mount_followed_by_consonant_regexp value
      self.homophone.gsub! regexp, ''
    end
  end

  def simple_replace!(key, values, options)
    regexp = mount_regexp values, options
    # p self.homophone
    # p regexp
    self.homophone.gsub! regexp, key.to_s
  end
end
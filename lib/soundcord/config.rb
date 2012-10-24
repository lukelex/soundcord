require 'yaml'

class SoundCord
  DEFAULT_LANGUAGE = 'pt-BR'
  LANGUAGES_DIRECTORY = "#{Dir.pwd}/lib/soundcord/languages/"

  class << self
    attr_reader :language, :options
  end

  def self.load_language lang = DEFAULT_LANGUAGE
    @language = lang
    @lang_yml = YAML::load_file(LANGUAGES_DIRECTORY + "#{lang}.yml")[language]
    @options  = { :use_vowels => false }
  end

private
  def self.lang_yml
    @lang_yml
  end
end
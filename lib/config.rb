require 'yaml'

class SoundCord
  DEFAULT_LANGUAGE = 'pt-BR'
  LANGUAGES_DIRECTORY = "#{Dir.pwd}/lib/soundcord/languages/"

  $KCODE = 'UTF8'

  def self.load_language lang = DEFAULT_LANGUAGE
    @language = lang
    @lang_yml ||= YAML::load_file(LANGUAGES_DIRECTORY + "#{lang}.yml")
  end

  def self.language
    @language
  end

  private
  def self.language= value
    @language = value
    @lang_yml = nil
  end
  def self.lang_yml
    @lang_yml
  end
end
module QuestionsHelper
  require 'mini_magick'
  require 'securerandom'

  BASE_IMAGE_PATH = './public/images/base_image.jpg'.freeze
  GRAVITY = 'center'.freeze
  TEXT_POSITION = '0,0'.freeze
  FONT = './app/assets/fonts/komorebi-gothic.ttf'.freeze
  FONT_SIZE = 65
  INDENTION_COUNT = 11
  ROW_LIMIT = 8

  class << self
    def build(text)
      text = prepare_text(text)
      @image = MiniMagick::Image.open(BASE_IMAGE_PATH)
      configuration(text)
    end


    def write(text)
      build(text)
      @image.write uniq_file_name
    end

    private

    def uniq_file_name
      "#{SecureRandom.hex}.png"
    end

    def configuration(text)
      @image.combine_options do |config|
        config.font FONT
        config.gravity GRAVITY
        config.pointsize FONT_SIZE
        config.draw "text #{TEXT_POSITION} '#{text}'"
      end
    end

    def prepare_text(text)
      text.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
    end
  end
end

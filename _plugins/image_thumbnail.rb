# image_thumbnail.rb

module Jekyll
  module ImageThumbnail
    def image_thumbnail(input)
      input.sub("/images/", "/images/thumbnail/")
    end
  end
end

Liquid::Template.register_filter(Jekyll::ImageThumbnail)

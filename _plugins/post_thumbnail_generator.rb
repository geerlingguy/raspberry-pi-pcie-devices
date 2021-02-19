# post_thumbnail_generator.rb
require 'mini_magick'

module Jekyll

  class PostThumbnailImage < StaticFile
    def initialize(site, base, dir, name)
      @site = site
      @base = base
      @dir = dir
      @dest_dir = File.join("images", "thumbnail")
      @name = name
      @@mtimes = {}
    end

    def destination(dest)
      File.join(dest, @dest_dir, @name)
    end

    def write(dest)
      dest_path = destination(dest)

      return false if File.exist?(dest_path) and !modified?
      @@mtimes[path] = mtime

      FileUtils.mkdir_p(File.dirname(dest_path))
      image = MiniMagick::Image.open(path)
      image.resize "200"
      image.write(dest_path)

      true
    end
  end

  class PostThumbnailGenerator < Generator
    def generate(site)
      # Loop through all site collections.
      site.collections.each do |name, collection|
        collection.docs.each do |doc|
          if doc.data.has_key?("picture")
            site.static_files << PostThumbnailImage.new(site, site.source, "images", File.basename(doc.data["picture"]))
          end
        end
      end
    end
  end

end

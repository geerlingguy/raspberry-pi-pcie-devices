# post_thumbnail_generator.rb
require "smartcropper"

module Jekyll

  class PostThumbnailImage < StaticFile
    def initialize(site, base, dir, name)
      @site = site
      @base = base
      @dir = dir
      @dest_dir = File.join("images", "thumbnail")
      @name = name
    end

    def destination(dest)
      File.join(dest, @dest_dir, @name)
    end

    def write(dest)
      dest_path = destination(dest)

      return false if File.exist?(dest_path) and !modified?
      @@mtimes[path] = mtime

      FileUtils.mkdir_p(File.dirname(dest_path))
      SmartCropper.from_file(path).smart_crop_and_scale(200, 200).write(dest_path)

      true
    end
  end

  class PostThumbnailGenerator < Generator
    def generate(site)
      # TODO: cards_m2, cards_network, cards_storage, etc...
      site.cards_gpu.each {|post|
        if post.data.has_key?("picture")
          site.static_files << PostThumbnailImage.new(site, site.source, "_images", File.basename(post.data["image"]))
        end
      }
    end
  end

end

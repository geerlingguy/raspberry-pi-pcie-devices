require "jekyll"
require 'net/http'
require 'uri'
require 'json'

class YouTube < Liquid::Tag

  def initialize(tagName, content, tokens)
    super
    @content = content
  end

  def render(context)
    youtube_url = "#{context[@content.strip]}"
    if youtube_url[/youtu\.be\/([^\?]*)/]
      @youtube_id = $1
    else
      # Regex from https://stackoverflow.com/a/4811367/100134
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      @youtube_id = $5
    end

    # Get Video data from YouTube.
    uri = URI('https://www.youtube.com/oembed?url=' + youtube_url + '&format=json)')
    json = Net::HTTP.get(uri)
    video_data = JSON(json)

    # Verify returned response has a title.
    if video_data.key?("title")
      video_title = video_data['title']
    else
      video_title = youtube_url
    end

    %Q{<a href="#{ youtube_url }">#{ video_title }</a>}
  end

  Liquid::Template.register_tag "youtube", self
end

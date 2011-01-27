module SitesHelper
  def textilize(text, read_more_link = nil)
    
  end
  
  def host_from_url(url)
    u = URI.parse(url)
    "#{u.scheme}://#{u.host}"
  end
  
  def thumbshot_tag(site)
    image_tag("http://open.thumbshots.org/image.aspx?url=#{Rack::Utils.escape(site.url)}", :alt => site.title)
  end
end

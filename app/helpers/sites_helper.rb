module SitesHelper
  def textilize(text, read_more_link = nil)
    
  end
  
  def thumbshot_tag(site)
    image_tag("http://open.thumbshots.org/image.aspx?url=#{Rack::Utils.escape(site.url)}", :alt => site.title)
  end
end

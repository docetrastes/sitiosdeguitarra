module SitesHelper
  def textilize(text, read_more_link = nil)
    puts text
    text = text.split("[read_more]")
    puts text.inspect
    if read_more_link && text.size > 1
      text = text.first + "<notextile>#{read_more_link}</notextile>"
    else
      text = text.join
    end
    r = RedCloth.new(text)
    r.no_span_caps = true
    r.to_html    
  end
  
  def host_from_url(url)
    u = URI.parse(url)
    "#{u.scheme}://#{u.host}"
  end
  
  def thumbshot_tag(site)
    image_tag("http://open.thumbshots.org/image.aspx?url=#{Rack::Utils.escape(site.url)}", :alt => site.title)
  end
end

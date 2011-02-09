# encoding: utf-8
module FeedEntriesHelper
  # Taken from http://daringfireball.net/2010/07/improved_regex_for_matching_urls
  URL_REGEXP = '(?i)\b((?:https?://|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\))  )*\)|[^\s`!()\[\]{};:\'".,<>?«»“”‘’]))'
    
  def textilize_feed_entry(text, url)
    replace_particularities(text)
    text = text + " <span class='read_more'>#{link_to "Leer más →", url, :target => "_blank"}</span>"
    r = RedCloth.new(text)
    r.no_span_caps = true
    r.to_html
  end
  
  private
  
  def replace_particularities(text)
    # Visto en guitarristas.info
    text.gsub!(/Image: #{URL_REGEXP}/) { "!(centered)#{$1}!" }
    # Visto en bigguitarvideo.net
    text.gsub!("Por favor Login o Register para ver el enlace de descarga.", "")
    text.gsub!(" Por favor Login...", "...")
    # Visto en guitarrista.com
    text.gsub!(/>(\s*)Slide Show/ , ">")
    text
  end
end

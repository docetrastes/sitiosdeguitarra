# encoding: utf-8
module FeedEntriesHelper
  # Taken from http://daringfireball.net/2010/07/improved_regex_for_matching_urls
  URL_REGEXP = '(?i)\b((?:https?://|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\))  )*\)|[^\s`!()\[\]{};:\'".,<>?«»“”‘’]))'
    
  def textilize(text)
    replace_particularities(text)
    r = RedCloth.new(text)
    r.no_span_caps = true
    r.to_html
  end
  
  private
  
  def replace_particularities(text)
    # Visto en guitarristas.info
    text.gsub!(/Image: #{URL_REGEXP}/) { "!(centered)#{$1}!" }
  end
end

module FeedEntriesHelper
  def textilize(text)
    r = RedCloth.new(text)
    r.no_span_caps = true
    r.to_html
  end
end

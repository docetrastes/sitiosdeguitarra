class StaticPagesController < ApplicationController
  def sitemap
    @tags = Tag.all
    @sites = Site.all
    @feed_entries = FeedEntry.recent
  end
  
  def home
    @feed_entries = FeedEntry.order("published_at desc").limit(2).all
    @sites = Site.limit(2).all
  end
end

class StaticPagesController < ApplicationController
  def sitemap
    @tags = Tag.all
    @sites = Site.all
  end
end

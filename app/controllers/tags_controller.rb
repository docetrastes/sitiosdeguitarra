class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_name!(params[:id])
    @sites = @tag.sites.paginate(:page => params[:page], :per_page => Site.per_page)
  end
end

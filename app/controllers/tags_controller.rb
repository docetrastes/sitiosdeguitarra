class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_name!(params[:id])
    @sites = @tag.sites
  end
end

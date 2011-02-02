class FeedEntriesController < ApplicationController
  before_filter :require_admin, :except => [ :index, :show ]
  
  def index
    @feed_entries = FeedEntry.recent.paginate(:page => params[:page])
  end

  def show
    @feed_entry = FeedEntry.find(params[:id])
  end

  def edit
    @feed_entry = FeedEntry.find(params[:id])
  end

  def update
    @feed_entry = FeedEntry.find(params[:id])
    if @feed_entry.update_attributes(params[:feed_entry])
      flash[:notice] = "Successfully updated feed entry."
      redirect_to feed_entry_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @feed_entry = FeedEntry.find(params[:id])
    @feed_entry.destroy
    flash[:notice] = "Successfully destroyed feed entry."
    redirect_to feed_entries_url
  end
end

class FeedEntriesController < ApplicationController
  def index
    @feed_entries = FeedEntry.recent.paginate(:page => params[:page], :per_page => 12)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

class AddFeedUrlToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :feed_url, :string
  end

  def self.down
    remove_column :sites, :feed_url
  end
end

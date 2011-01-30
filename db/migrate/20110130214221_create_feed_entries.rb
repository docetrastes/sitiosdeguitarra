class CreateFeedEntries < ActiveRecord::Migration
  def self.up
    create_table :feed_entries do |t|
      t.integer :site_id
      t.string :title
      t.text :summary
      t.string :url
      t.datetime :published_at
      t.string :guid
      t.text :categories

      t.timestamps
    end
  end

  def self.down
    drop_table :feed_entries
  end
end

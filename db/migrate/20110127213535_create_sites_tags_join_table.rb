class CreateSitesTagsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :sites_tags, :id => false do |t|
      t.integer :site_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :sites_tags
  end
end

class FeedEntry < ActiveRecord::Base
  belongs_to :site
  validates_presence_of :site_id, :title, :summary, :url, :published_at, :guid
  validates_uniqueness_of :guid, :scope => :site_id

  serialize :categories, Array

  def self.update_from_site(site)
    feed = Feedzirra::Feed.fetch_and_parse(site.feed_url)
    feed.entries.each do |entry|
      unless exists?(:guid => entry.id, :site_id => site.id)
        create!(:site_id      => site.id,
                :title        => entry.title,
                :summary      => entry.summary,
                :url          => entry.url,
                :published_at => entry.published,
                :guid         => entry.id
        )
      end
    end
  end
  
  def truncated_summary(maximum_words = 30)
    s = Hpricot(summary).to_plain_text
    words = s.split
    s = words[0..maximum_words-1].join(" ")
    words.size <= maximum_words ? s : s + "..."
  end
end

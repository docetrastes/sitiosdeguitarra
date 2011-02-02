class FeedEntry < ActiveRecord::Base
  belongs_to :site
  validates_presence_of :site_id, :title, :summary, :url, :published_at, :guid
  validates_uniqueness_of :guid, :scope => :site_id

  serialize :categories, Array
  
  scope :recent, order("published_at desc")

  def self.update_from_site(site)
    feed = Feedzirra::Feed.fetch_and_parse(site.feed_url)
    puts "Fetched #{feed.entries.size} feed entries from #{site.feed_url}."
    feed.entries.each do |entry|
      unless exists?(:guid => entry.id, :site_id => site.id)
        create!(:site_id      => site.id,
                :title        => entry.title,
                :summary      => entry.summary.blank? ? entry.content : entry.summary,
                :url          => entry.url,
                :published_at => entry.published,
                :guid         => entry.id
        )
        puts "  Created feed entry titled '#{entry.title}'."
      end
    end
  end
  
  def truncated_summary(maximum_words = 30)
    doc = Hpricot(summary)
    image = doc.search("img").first
    doc.search("img").remove
    words = doc.to_plain_text.split
    s = words[0..maximum_words-1].join(" ")
    s = words.size <= maximum_words ? s : s + "..."
    image.nil? ? s : image.to_html + s
  end
  
  def to_param
    "#{id}-#{title.to_url}"
  end
  
  def self.per_page
    12
  end
end

class Site < ActiveRecord::Base
    has_and_belongs_to_many :tags
    
    def tag_names=(some_names)
      self.tags = some_names.split(",").collect { |name| Tag.find_or_create_by_name(name.strip) }
    end
    
    def tag_names
      self.tags.collect(&:name).join(", ")
    end
    
    def to_param
      "#{id}-#{title.to_url}"
    end
    
    def self.per_page
      4
    end    
end

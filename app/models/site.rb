class Site < ActiveRecord::Base
    attr_accessible :title, :url, :review
    
    def to_param
      "#{id}-#{title.to_url}"
    end
end

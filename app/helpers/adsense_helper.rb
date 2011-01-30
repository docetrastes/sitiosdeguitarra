module AdsenseHelper
  
  # See https://www.google.com/adsense/static/en_US/AdFormats.html for more styles
  def adsense_wrapper(style = :leaderboard, &block)
    @adsense_ads_so_far ||= 0
    if @adsense_ads_so_far < 3 && Rails.env != "development"
      yield(block)
      @adsense_ads_so_far += 1
    else
      case style
      when :leaderboard
        image_tag("https://www.google.com/adsense/static/en_US/images/leaderboard.gif")
      when :banner
        image_tag("https://www.google.com/adsense/static/en_US/images/banner.gif")
      else
        raise "Not implemented"
      end
    end
  end
end

desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  Site.where("feed_url is not null").each do |site|
    puts "Updating feed entries for site '#{site.title}'"
    FeedEntry.update_from_site(site)
  end
end

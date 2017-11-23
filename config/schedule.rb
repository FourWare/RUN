set :environment, "production"
set :output, "/log/cron_log.log"


every 1.day :at => '3 AM' do
#every 2.minutes do
    runner "StatsJob.perform_later"
end


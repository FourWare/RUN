set :environment, "development"
set :output, "#{path}/log/cron_log.log"
env :PATH, ENV['PATH']

every 1.day :at => '3 AM' do
#every 2.minutes do
    runner "StatsJob.perform_later"
end


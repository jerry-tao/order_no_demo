require 'sidekiq'
require 'sidekiq-scheduler'
$redis = Redis.new

Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq.schedule = {
        "check_order_no":{
          "every"=> ["1m"],
          "class"=> "OrderCheckWorker",
        }
    }
    Sidekiq::Scheduler.reload_schedule!
  end
end

require './workers/order_no_worker'
require './workers/order_check_worker'

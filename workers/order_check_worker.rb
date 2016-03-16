class OrderCheckWorker
  include Sidekiq::Worker
  def perform
    count = $redis.scard('order_no')
    if count < 1000
      OrderNoWorker.perform_async
    end
  end
end

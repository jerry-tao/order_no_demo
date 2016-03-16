class OrderNoWorker
  include Sidekiq::Worker
  def perform
    10000.times do
      $redis.sadd('order_no',order_no)
    end
  end

# 测试5000万条数据生成非重复订单4987万左右。耗时20分钟。i5处理器。
#   def order_no
#    now = Time.now
#    Time.now.strftime('%Y%m%d') + now.usec.to_s + ("%05d" % rand(9999))
#  end

# def perform
#  hash = {}
#  50000000.times do
#    hash[order_no] = true
#  end
#  puts hash.count
# end

# require 'benchmark'
# Benchmark.measure { perform }
# 49875890
# => #<Benchmark::Tms:0x007f8640bd8968 @cstime=0.0, @cutime=0.0, @label="", @real=1337.4219126790013, @stime=371.69, @total=1184.8799999999999, @utime=813.1899999999999>
  def order_no
    now = Time.now
    Time.now.strftime('%Y%m%d') + now.usec.to_s + ("%05d" % rand(9999))
  end
end

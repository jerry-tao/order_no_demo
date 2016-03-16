require 'json'
class OrderNoService
  def order_no
    order_no = $redis.spop('order_no')
    order_no.nil? ? {error:'There is no order_no current.'}.to_json : {order_no: order_no}.to_json
  end
  def call(env)
    ['200', {'Content-Type' => 'application/json'}, [order_no]]
  end
end
# 纯rack版本相对sinatra提高不多 看来主要瓶颈是IO
# ab -c100 -n15000 http://localhost:9292/
# This is ApacheBench, Version 2.3 <$Revision: 1663405 $>
# Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
# Licensed to The Apache Software Foundation, http://www.apache.org/
#
# Benchmarking localhost (be patient)
# Completed 1500 requests
# Completed 3000 requests
# Completed 4500 requests
# Completed 6000 requests
# Completed 7500 requests
# Completed 9000 requests
# Completed 10500 requests
# Completed 12000 requests
# Completed 13500 requests
# Completed 15000 requests
# Finished 15000 requests
#
#
# Server Software:
# Server Hostname:        localhost
# Server Port:            9292
#
# Document Path:          /
# Document Length:        34 bytes
#
# Concurrency Level:      100
# Time taken for tests:   9.099 seconds
# Complete requests:      15000
# Failed requests:        1411
#    (Connect: 0, Receive: 0, Length: 1411, Exceptions: 0)
# Total transferred:      1273423 bytes
# HTML transferred:       508423 bytes
# Requests per second:    1648.45 [#/sec] (mean)
# Time per request:       60.663 [ms] (mean)
# Time per request:       0.607 [ms] (mean, across all concurrent requests)
# Transfer rate:          136.67 [Kbytes/sec] received
#
# Connection Times (ms)
#               min  mean[+/-sd] median   max
# Connect:        0    0   0.3      0      10
# Processing:     9   60   7.7     58     117
# Waiting:        7   60   7.7     58     116
# Total:         13   60   7.8     58     119
#
# Percentage of the requests served within a certain time (ms)
#   50%     58
#   66%     60
#   75%     62
#   80%     63
#   90%     70
#   95%     78
#   98%     85
#   99%     88
#  100%    119 (longest request)

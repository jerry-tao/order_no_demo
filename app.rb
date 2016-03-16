require 'sinatra'
require 'json'

get '/' do
  order_no = $redis.spop('order_no')
  order_no.nil? ? {error:'There is no order_no current.'}.to_json : {order_no: order_no}.to_json
end
#
# 压力测试不是很理想
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
# Time taken for tests:   14.693 seconds
# Complete requests:      15000
# Failed requests:        1414
#   (Connect: 0, Receive: 0, Length: 1414, Exceptions: 0)
# Total transferred:      3103434 bytes
# HTML transferred:       508434 bytes
# Requests per second:    1020.89 [#/sec] (mean)
# Time per request:       97.953 [ms] (mean)
# Time per request:       0.980 [ms] (mean, across all concurrent requests)
# Transfer rate:          206.27 [Kbytes/sec] received
#
# Connection Times (ms)
#              min  mean[+/-sd] median   max
# Connect:        0    0   0.2      0       4
# Processing:    15   98  23.1     92     315
# Waiting:       14   97  23.0     91     314
# Total:         18   98  23.1     92     315
#
# Percentage of the requests served within a certain time (ms)
#  50%     92
#  66%     95
#  75%     97
#  80%     99
#  90%    111
#  95%    123
#  98%    179
#  99%    201
# 100%    315 (longest request)

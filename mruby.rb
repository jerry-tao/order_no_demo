if server_name == "NGINX"
  Server = Nginx
elsif server_name == "Apache"
  Server = Apache
end
userdata = Userdata.new "redis_data_key"
redis = userdata.redis
result = JSON::stringify({"order_no"=>"20160315"})
Server::rputs redis.spop("order_no")

# ab -k -c100 -n10000 http://127.0.0.1:8080/mruby
# This is ApacheBench, Version 2.3 <$Revision: 1663405 $>
# Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
# Licensed to The Apache Software Foundation, http://www.apache.org/
#
# Benchmarking 127.0.0.1 (be patient)
# Completed 1000 requests
# Completed 2000 requests
# Completed 3000 requests
# Completed 4000 requests
# Completed 5000 requests
# Completed 6000 requests
# Completed 7000 requests
# Completed 8000 requests
# Completed 9000 requests
# Completed 10000 requests
# Finished 10000 requests
#
#
# Server Software:        nginx/1.9.12
# Server Hostname:        127.0.0.1
# Server Port:            8080
#
# Document Path:          /mruby
# Document Length:        34 bytes
#
# Concurrency Level:      100
# Time taken for tests:   0.697 seconds
# Complete requests:      10000
# Failed requests:        0
# Keep-Alive requests:    9900
# Total transferred:      1559500 bytes
# HTML transferred:       340000 bytes
# Requests per second:    14339.08 [#/sec] (mean)
# Time per request:       6.974 [ms] (mean)
# Time per request:       0.070 [ms] (mean, across all concurrent requests)
# Transfer rate:          2183.77 [Kbytes/sec] received
#
# Connection Times (ms)
#               min  mean[+/-sd] median   max
# Connect:        0    0   0.3      0       5
# Processing:     1    7   1.4      6      17
# Waiting:        1    7   1.4      6      17
# Total:          5    7   1.4      6      19
#
# Percentage of the requests served within a certain time (ms)
#   50%      6
#   66%      7
#   75%      7
#   80%      7
#   90%      8
#   95%     10
#   98%     11
#   99%     13
#  100%     19 (longest request)

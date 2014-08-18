X_REQUESTS_PER_SECOND = 10

# 检查 ip 请求限制
# @param ip
# @raise 超过限制，抛出 RuntimeError 异常

def check_request_limitation_for_ip(ip)
  time_tick = Time.now.to_i
  key = "#{ip}:#{time_tick}"
  num = $redis.get(key).to_i
  if num > MAX_REQUEST_PER_SECOND
    raise 'too many requests'
  else
    $redis.incr(key)
    $redis.expire(key, 10)
  end
end





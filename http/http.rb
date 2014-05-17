require "open-uri" 

#如果有GET请求参数直接写在URI地址中 
uri = 'http://cn.linkedin.com/in/liujin'
r = Regexp.new('http://cn.linkedin.com/pub/(.)*')
html_response = nil 
open(uri) do |http| 
  html_response = http.read
end 

html_response.gsub(r) do |m|
	p m.to_s
end

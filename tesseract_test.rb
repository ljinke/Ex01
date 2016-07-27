require 'rubygems'
require 'rtesseract'
require 'RMNLDKMDNDFBHJTO;LWLLQ QPPOOPagick'

mix_block = RTesseract::Mixed.new("/Users/liujin/Desktop/test.png") do |image|
  image.area(118,  30, 487, 93)
end

mix_block.to_s

image = RTesseract.new("/Users/liujin/Desktop/test.png")
image.to_s #Getting the value
require 'rubygems'
#require 'pdf/reader'
gem 'pdf-reader', '=1.1.1'
require 'pdf-reader-turtletext'
require 'pry'
require 'pry-byebug'

filename = "/Users/liujin/sample.pdf"

#receiver = PDF::Reader::TextReceiver.new($stdout)
#binding.pry
#pdf = PDF::Reader.file(filename, receiver)

options = { :y_precision => 5 }
reader_with_options = PDF::Reader::Turtletext.new(filename,options)
text = reader_with_options.text_in_region(
  2000,   # minimum x (left-most)
  4000,  # maximum x (right-most)
  0,  # minimum y (bottom-most)
  100,  # maximum y (top-most)
  28,    # page (default 1)
  false # inclusive of x/y position if true (default false)
)

p text

text_by_exact_match = reader_with_options.text_position("A100", 31)

p text_by_exact_match


require 'rubygems'
require 'pdf/reader'

receiver = PDF::Reader::RegisterReceiver.new
filename = "/home/jackie/Downloads/a.pdf"

PDF::Reader.open(filename) do |reader|
  reader.pages.each do |page|
    page.walk(receiver)
    receiver.callbacks.each do |cb|
      puts cb
    end
  end
end
Dir[File.dirname(__FILE__) + "/polaris/*.rb"].each do |file|
  #p file
  require file
end

if __FILE__ == $0
  h = [4,2,4,4.5,2]
  w = []

end
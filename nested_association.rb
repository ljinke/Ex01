def describe associations, from = 'base'
  case associations
  when Symbol then puts "load #{associations} from #{from}"
  when Array then associations.each {|a| describe a, from}
  when Hash then
    associations.each do |parent, child|
      raise "Invalid hash - key must be an association name" unless parent.is_a?(Symbol)
      describe parent, from
      describe child, parent
    end
  end
end

if __FILE__ == $0

  describe [{:comments => :user}, :category]
  
end
require 'resque'
class User
  @queue = :food

  def self.perform(name)
    puts "your name is #{name}"
  end
end

r = Resque.new

Resque.enqueue(User, "Hello")
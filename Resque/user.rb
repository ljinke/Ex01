class User
  @queue = :food

  def self.perform(name)
    puts "your name is #{name}"
  end
end
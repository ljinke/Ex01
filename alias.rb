class User

  def full_name
    puts "Johnnie Walker"
  end

  def self.add_rename
    alias_method :name, :full_name
  end

  def self.add_rename2
  	alias :name2 :full_name
  end
end

class Developer < User
  def full_name
    puts "Geeky geek"
  end
  add_rename
  add_rename2
end

Developer.new.name #=> 'Gekky geek'
Developer.new.name2 #=> 'Jonnie Walker'

#This is because alias is a keyword and it is lexically scoped. 
#It means it treats self as the value of self at the time the source code was read . 
#In contrast alias_method treats self as the value determined at the run time.
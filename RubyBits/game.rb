class Game
  attr_reader :name

  def initialize(name)
    @name = name
    @year = nil
    @system = nil
    @tags = []
  end

  # Add methods to store year and system
  def system(sys)
    @system = sys
  end
  
  def year(yr)
    @year = yr
  end

  def print_details
    puts "#{@name} - #{@year} (#{@system})"
  end
 
  def play
    puts "Play #{@name}"
  end
 
  def capture_screenshot
    puts  "capture_screenshot #{@name}"
  end

  def method_missing(name,*args)
    @tags << name
  end

end
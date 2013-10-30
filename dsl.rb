require_relative "game.rb"
require_relative "library.rb"

LIBRARY = Library.new

def add_game(name, system = nil, year = nil, &block)
  game = Game.new(name)
  game.system(system) if system
  game.year(year) if year
  # Capture the block and call it here
  if block_given?
    game.instance_eval(&block)
  end
  LIBRARY.add_game(game)
end

def with_game(*names,  &block)
	names.each do |name|
	  game = LIBRARY.find_by_name(name)
	  game.instance_eval(&block)
	end
end

def with_games_tagged(tag, &block)
	games = LIBRARY.find_by_tag(tag)
	games.each do |game|
		game.instance_eval(&block)
	end
end



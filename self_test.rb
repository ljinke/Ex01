class SelfTest
	attr_accessor :games

	def initialize(my_games)
		self.games = my_games #cannot use accessor games directly here in initialize
	end

	def add_game(game)
		games << game
	end

	def print
		games.each {|game| puts game}
	end

end

if __FILE__ == $0
	t = SelfTest.new(["Super Mary"])
	t.add_game("Starcraft")
	t.print
end
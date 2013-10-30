class Game
	[:a,:b,:c].each do |x|
		define_method x do 
			puts x
		end
	end
end

game = Game.new()
game.a

method_a = game.method(:a)
method_a.call
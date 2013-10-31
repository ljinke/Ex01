
class Car

	def price
		100000
	end

end

class CarWithHeatedSeat < SimpleDelegator
	def initialize(component)
		super
	end

	def price
		super + 5000
	end

end

if __FILE__ == $0
	car = Car.new
	puts car.price

	carWith = CarWithHeatedSeat.new(car)
	puts car.price
end
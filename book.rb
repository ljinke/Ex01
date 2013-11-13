class Book
	attr_accessor :name, :author, :price, :published_date, :isbn
	def initialize(name, author, price, published, isbn)
		@name = name	
		@author = author
		@price = price
		@published_date = published
		@isbn = isbn
	end
end
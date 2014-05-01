/

+---------------+				+----------------------+
|	context		|-------------->|	sor Strategy	   |	
+---------------+				+----------------------+
											^
											|
											|
											|
						+-------------------+---------------------+
						|					|					  |
				+--------------+	+---------------+   +-----------------------+
				|	sort by	id |	| sort by name  |	|  sort by published_at |
				+--------------+	+---------------+	+-----------------------+
/

require 'time'

class Book
	attr_accessor :id, :title, :published_at, :author

	def initialize(id, title, published_at, author)
		@id = id
		@title = title
		@published_at = published_at
		@author = author
	end
end

books = [Book.new(1, "Core Java", Date.parse('2011-01-01'), 'Tom'), 
	Book.new(2, "Prog WCF", Date.parse('2007-03-01'), 'Jerry')]

p books.sort{|a,b| a.id <=> b.id}

p books.sort{|a,b| a.published_at <=> b.published_at}

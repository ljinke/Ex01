require_relative '../book.rb'
require_relative '../library.rb'

require 'yaml'

require 'spec_helper.rb'

describe Book do 
	before :all do
		@time = DateTime.now
		@book = Book.new('RSpec - BDD', 'unknow author', 99, @time, '0000-9977-3333')
	end
	context 'a good book' do
		it 'should hav a title' do
			@book.name.should_not be_empty
		end
		it 'should have a isbn' do
			@book.isbn.should_not be_empty
		end
		it 'should have a price' do
			@book.should respond_to(:price)
		end
		it 'should have a author' do
			@book.author.should_not be_empty
		end
		it 'should have a published_date' do
			@book.published_date.should eql @time
		end
	end
	
end

describe Book do 
	subject do
		Book.new('RSpec - BDD', 'unknow author', 99, @time, '0000-9977-3333')
	end
	context 'a good book' do
		its (:name) {should_not be_empty}
		its(:isbn) {should_not be_empty}
		
		its(:author) {should_not be_empty}
		its(:published_date) {should eql @time}
	end
	
end

require "test/unit"
require_relative '../gcd.rb'

class TestChop < Test::Unit::TestCase

	def test_gcd
		common(-> (x,y){ gcd(x,y) })
	end
	def test_gcd
		common(method(:gcd_recursive))
	end
	private
	def common(f)
		assert_equal(1,f.call(1,1))
		assert_equal(1,f.call(1,2))
		assert_equal(1,f.call(1,3))
		assert_equal(1,f.call(2,3))
		assert_equal(2,f.call(2,4))
		assert_equal(2,f.call(2,6))

		assert_equal(3,f.call(6,9))
		assert_equal(6,f.call(6,12))
		assert_equal(6,f.call(12,18))
		assert_equal(27,f.call(54,81))

		assert_equal(1,f.call(1000,499))
		assert_equal(3,f.call(123,321))
	end
end
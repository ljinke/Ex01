require "test/unit"
require_relative '../chop.rb'

class TestChop < Test::Unit::TestCase
  def test_chop
    inner_func(method(:chop))
  end
  def test_chop_recursive
    inner_func(method(:chop_recursive))
  end
  
  private 
    def inner_func(f)
        assert_equal(-1, f.call(3, []))
        assert_equal(-1, f.call(3, [1]))
        assert_equal(0,  f.call(1, [1]))
        #
        assert_equal(0,  f.call(1, [1, 3, 5]))
        assert_equal(1,  f.call(3, [1, 3, 5]))
        assert_equal(2,  f.call(5, [1, 3, 5]))
        assert_equal(-1, f.call(0, [1, 3, 5]))
        assert_equal(-1, f.call(2, [1, 3, 5]))
        assert_equal(-1, f.call(4, [1, 3, 5]))
        assert_equal(-1, f.call(6, [1, 3, 5]))
        #
        assert_equal(0,  f.call(1, [1, 3, 5, 7]))
        assert_equal(1,  f.call(3, [1, 3, 5, 7]))
        assert_equal(2,  f.call(5, [1, 3, 5, 7]))
        assert_equal(3,  f.call(7, [1, 3, 5, 7]))
        assert_equal(-1, f.call(0, [1, 3, 5, 7]))
        assert_equal(-1, f.call(2, [1, 3, 5, 7]))
        assert_equal(-1, f.call(4, [1, 3, 5, 7]))
        assert_equal(-1, f.call(6, [1, 3, 5, 7]))
        assert_equal(-1, f.call(8, [1, 3, 5, 7]))
    end
end
require "test/unit"
require_relative '../chop.rb'

class TestChop < Test::Unit::TestCase
  def test_chop
    assert_equal(-1, chop(3, []))
    assert_equal(-1, chop(3, [1]))
    assert_equal(0,  chop(1, [1]))
    #
    assert_equal(0,  chop(1, [1, 3, 5]))
    assert_equal(1,  chop(3, [1, 3, 5]))
    assert_equal(2,  chop(5, [1, 3, 5]))
    assert_equal(-1, chop(0, [1, 3, 5]))
    assert_equal(-1, chop(2, [1, 3, 5]))
    assert_equal(-1, chop(4, [1, 3, 5]))
    assert_equal(-1, chop(6, [1, 3, 5]))
    #
    assert_equal(0,  chop(1, [1, 3, 5, 7]))
    assert_equal(1,  chop(3, [1, 3, 5, 7]))
    assert_equal(2,  chop(5, [1, 3, 5, 7]))
    assert_equal(3,  chop(7, [1, 3, 5, 7]))
    assert_equal(-1, chop(0, [1, 3, 5, 7]))
    assert_equal(-1, chop(2, [1, 3, 5, 7]))
    assert_equal(-1, chop(4, [1, 3, 5, 7]))
    assert_equal(-1, chop(6, [1, 3, 5, 7]))
    assert_equal(-1, chop(8, [1, 3, 5, 7]))
  end
  def test_chop_recursive
    assert_equal(-1, chop_recursive(3, []))
    assert_equal(-1, chop_recursive(3, [1]))
    assert_equal(0,  chop_recursive(1, [1]))
    #
    assert_equal(0,  chop_recursive(1, [1, 3, 5]))
    assert_equal(1,  chop_recursive(3, [1, 3, 5]))
    assert_equal(2,  chop_recursive(5, [1, 3, 5]))
    assert_equal(-1, chop_recursive(0, [1, 3, 5]))
    assert_equal(-1, chop_recursive(2, [1, 3, 5]))
    assert_equal(-1, chop_recursive(4, [1, 3, 5]))
    assert_equal(-1, chop_recursive(6, [1, 3, 5]))
    #
    assert_equal(0,  chop_recursive(1, [1, 3, 5, 7]))
    assert_equal(1,  chop_recursive(3, [1, 3, 5, 7]))
    assert_equal(2,  chop_recursive(5, [1, 3, 5, 7]))
    assert_equal(3,  chop_recursive(7, [1, 3, 5, 7]))
    assert_equal(-1, chop_recursive(0, [1, 3, 5, 7]))
    assert_equal(-1, chop_recursive(2, [1, 3, 5, 7]))
    assert_equal(-1, chop_recursive(4, [1, 3, 5, 7]))
    assert_equal(-1, chop_recursive(6, [1, 3, 5, 7]))
    assert_equal(-1, chop_recursive(8, [1, 3, 5, 7]))
  end
end
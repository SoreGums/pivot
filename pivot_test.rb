require_relative "pivot.rb"
require "test/unit"


class TestPivot < Test::Unit::TestCase
    def test_pivot_expected_data
        assert_equal(-1, pivot([5]))
        assert_equal(-1, pivot([0, 2]))
        assert_equal( 1, pivot([1, 1, 1]))
        assert_equal( 2, pivot([4, 3, 2, 7]))
        assert_equal( 2, pivot([1, 4, 6, 3, 2]))
        assert_equal( 2, pivot([1, 2, 3, 1, 1, 1]))
        assert_equal( 3, pivot([1, 2, 7, 3, 2, 9, -1]))
        assert_equal( 3, pivot([-10, 5, 9, 0, 20, -30, 14, 0]))
        assert_equal( 5, pivot([1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]))
        assert_equal( 3, pivot([5, 3, 1, 3, 1, 2, 3, 0, 1, 1, 1]))
        assert_equal(-1, pivot([1, 4, 6, 9, 1, 8, 20, 45, 13, 6]))
    end

    def test_pivot_negative_numbers
         # this one is tricky to optimise for as left is greater than right until it is equal
        assert_equal( 3, pivot([-10, 2, -70, 42, -100, 45, -23]))
    end

    def test_pivot_big_numbers
        assert_equal( 1, pivot([4611686018427387903, 1, 4611686018427387903]))
        assert_equal( -1, pivot([4611686018427387903, 92587292, 183849292587292, 1838492, 18427387903, 4611686]))
    end

    def test_pivot_list30
        assert_equal( 2, pivot([-87, 304, 67, 12, 13, 5, 56, 2, 7, 3, 33, 25, -91, 1, 15, 2, 16, 56, 7, 78, -241, 14, 5, 1, 6, 112, 2, 5, 61, 12]))
        assert_equal( 7, pivot([9, 1, 7, 9, 8, 9, 8, 4, 7, 2, 2, 6, 2, 1, 1, 0, 1, 3, 0, 1, 1, 6, 0, 2, 5, 4, 1, 1, 1, 4]))
        assert_equal(12, pivot([37, 22, 46, 0, 3, 40, 40, 37, 32, 27, 20, 34, 24, 22, 38, 3, 29, 20, 26, 17, 26, 10, 23, 19, 31, 30, 13, 11, 9, 11]))
        # google result will fail on this one as well
        assert_equal(23, pivot([3, 1, 23, 1, 4, 51, 6, 7, 27, 7, 8, 3, 2, 7, 2, 73, 7, 3, 7, 3, 2, 2, 6, -500, 97, 43, 56, 19, -83, 123]))
        assert_equal(-1, pivot([5, 3, 4, 24, 4, 5, 26, 7, 7, 17, 20, 2, 25, 13, 19, 3, 29, 12, 26, 13, 24, 25, 16, 1, 13, 14, 0, 5, 3, 29]))
    end

    # should get -1 for anything given that is NOT a list of integers
    def test_pivot_unexpected_data
        assert_equal(-1, pivot({ :font_size => 10, :font_family => "Arial" }))
        assert_equal(-1, pivot([1, 3, 3.0, 4]))
        assert_equal(-1, pivot(%w(cat dog pig cow)))
        assert_equal(-1, pivot("August"))
        assert_equal(-1, pivot([1, "two", 3.0]))
        assert_equal(-1, pivot(pivot([1, 4, 6, 3, 2])))
    end

    #def test_is_pivot?()
    #    assert_equal(true, is_pivot?([1, 4, 6, 3, 2], 2))
    #
    #    # lots of numbers on the right
    #    assert_equal(false, is_pivot?([3, 3, 1, -2, 4], 0))
    #    assert_equal(true,  is_pivot?([3, 3, 1, -2, 4], 1))
    #    assert_equal(false, is_pivot?([3, 3, 1, -2, 4], 2))
    #    assert_equal(false, is_pivot?([3, 3, 1, -2, 4], 3))
    #    assert_equal(false, is_pivot?([3, 3, 1, -2, 4], 4))
    #
    #    # go out of bounds
    #    assert_equal(false, is_pivot?([3, 3, 1, -2, 4], 5))
    #    assert_equal(false, is_pivot?([3, 3, 1, -2, 4], 6))
    #
    #    # lots of numbers on the left
    #    assert_equal(false, is_pivot?([3, 3, 1, -5, 4, 2, 6], 1))
    #    assert_equal(false, is_pivot?([3, 3, 1, -5, 4, 2, 6], 2))
    #    assert_equal(false, is_pivot?([3, 3, 1, -5, 4, 2, 6], 3))
    #    assert_equal(false, is_pivot?([3, 3, 1, -5, 4, 2, 6], 4))
    #    assert_equal(true,  is_pivot?([3, 3, 1, -5, 4, 2, 6], 5))
    #    assert_equal(false, is_pivot?([3, 3, 1, -5, 4, 2, 6], 6))
    #
    #    # not enough numbers
    #    assert_equal(false, is_pivot?([5], 1))
    #
    #    # can't be a pivot as no number on the right, zero needs to equal zero not nothing
    #    assert_equal(false, is_pivot?([0, 1], 1))
    #end
    
end

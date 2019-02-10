#  After I finsihed my solution I Googled and found this
#
#  def pivot(arr)
#    i, sum_left, total = 0, 0, arr.inject(:+)
#    sum_left, i = sum_left+arr[i], i+1 until sum_left >= (total-arr[i])/2
#    return ((sum_left == (total-arr[i])/2) and (arr.length > 2)) ? i:-1
#  end
#  
# Which is mighty fast and obvious now, however it can't handle negative numbers well
#
#   pivot([-10,2,-70,42,-100,45,-23]) #=> -1. It should be 3 [-78, 42, -78]
#
# as the left side is greater than right until it is equal
# so not sure how this is optimised for other than to look for negative numbers and 
#  if found go the is sumLeft == sumRight?
#
#
# ok so take that idea and tweak it a bit, instead of calculating the sums of left and right everytime
#  or calculate just left and assume if it is bigger than right, done
#    just update as moving through the array until left is equal to right or run out of numbers.
#     then let just catch weirdness as things get to the end of the array
#
#  0) [2,3,5,4,1,9] 
#  1) left = 2      , right = 19      , i=1
#  2) left = 2+3(5) , right = 19-5(14), i=2
#  3) left = 5+5(10), right = 14-4(10), i=3
#

require "active_support"
require "active_support/core_ext/array/access"

# returns the "pivot" index of a list of integers (as in the data type, -1000 to 1000 as opposed to "numbers")
# the pivot index is the index where the sum of the numbers on the left are equal to the sum of the numbers on the right
# - multiple pivots might exist, only care about the first one
#   - all numbers to the left of the pivot need to equal all numbers to the right else no pivot in the list
# return -1
#  - if no pivot_index found
#    - can't find a pivot_index if given a list of words...

def pivot(arr)
    # only work on arrays that have integers in them and length is > 2
    begin
        return -1 unless arr.all? { |i| i.is_a? Integer } and arr.length > 2

        # original solution before google
        #
        # arr.each_index do |i|
        #     return i if arr.to(i-1).reduce(:+) === arr.from(i+1).reduce(:+)
        # end

        # new solution after google
        left, right, i = arr[0], arr.from(2).reduce(:+), 1
        until left == right do
            left, right, i = left+arr[i], right-arr[i+1], i+1
        end
        return i if left == right
        # none found, probably won't see this, will hit an exception
        return -1
    rescue
        # junk input for arr
        # or an exception that means didn't find a pivot index
        return -1
    end

    # should not get here
    -2
end

# checks passed array to see if the sum of left side of the index is equal
#  to the sum of the sum of the right side of array.

#def is_pivot?(arr, index)
#    # left = arr.to(index-1).reduce { |total, num| total + num }
#    # right = arr.from(index+1).reduce { |total, num| total + num }
#    # 
#    # left === right
#    
#    # this one-liner is slightly faster than the above (100_000 iteration benchamrk)
#    arr.to(index-1).reduce(:+) === arr.from(index+1).reduce(:+)
#end



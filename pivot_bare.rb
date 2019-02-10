require "active_support"
require "active_support/core_ext/array/access"

def pivot(arr)
    begin
        return -1 unless arr.all? { |i| i.is_a? Integer } and arr.length > 2
        left, right, i = arr[0], arr.from(2).reduce(:+), 1
        until left == right do
            left, right, i = left+arr[i], right-arr[i+1], i+1
        end
        return i if left == right
        return -1
    rescue
        return -1
    end
    -2
end

pivot([1, 4, 6, 3, 2]) #=> 2
pivot([-10, 2, -70, 42, -100, 45, -23]) #=> 3
pivot([3, 1, 23, 1, 4, 51, 6, 7, 27, 7, 8, 3, 2, 7, 2, 73, 7, 3, 7, 3, 2, 2, 6, -500, 97, 43, 56, 19, -83, 123]) #=> 23
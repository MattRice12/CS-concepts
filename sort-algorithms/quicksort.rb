class Array
  def quicksort
    return [] if empty?
    pivot = delete_at(rand(size))
    left, right = partition(&pivot.method(:>))
    return *left.quicksort, pivot, *right.quicksort
  end
end

arr = [199, 1, -30, 500, 60, 72, 8, 9, 11]
arr2 = ["a", "b", "f", "e", "d"]

print arr.quicksort
puts
print arr2.quicksort

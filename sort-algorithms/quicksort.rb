class Array
  def quicksort
    return [] if empty?
    pivot = delete_at(rand(size))
    left, right = partition(&pivot.method(:>))
    return *left.quicksort, pivot, *right.quicksort
  end

  def quicksort_two
    return [] if empty?
    map do |piv|
      pivot = index(piv)
      storeIndex = pivot + 1
      self[(pivot + 1)..length].map do |i|
        dex = index(i)
        if i < self[pivot]
          self[dex], self[storeIndex] = self[storeIndex], self[dex]
          storeIndex += 1
        end
      end
      self[pivot], self[storeIndex - 1] = (self[storeIndex - 1]), self[pivot]
    end
    self
  end
end

arr = [199, 1, -30, 500, 60, 72, 8, 9, 11]
arr2 = ["a", "b", "f", "e", "d"]
arr3 = [5, 4, 3, 2, 1]


# puts arr.quicksort.inspect
#
# puts arr2.quicksort.inspect

puts arr.quicksort_two.inspect
# puts arr3.quicksort_two.inspect


# for each unsorted partition
# set first element as pivot
# storeIndex = pivotIndex + 1
# for i = pivotIndex + 1 to rightmostIndex
#   if element[i] < element[pivot]
#     swap(i, storeIndex); storeIndex++
# swap(pivot, storeIndex - 1)

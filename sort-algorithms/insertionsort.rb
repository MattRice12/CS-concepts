# Complexity:
  ## best:    O(n)
  ## average: O(n^2)
  ## worst:   O(n^2)

# Algorithm:
  # Insertion sort iterates, consuming one input element each repetition, and growing a sorted output list.
  # Each iteration, insertion sort removes one element from the input data, finds the location it belongs within the sorted list, and inserts it there. It repeats until no input elements remain.

  # 1. Sorting is typically done in-place, by iterating up the array, growing the sorted list behind it.
  # 2. At each array-position, it checks the value there against the largest value in the sorted list (which happens to be next to it, in the previous array-position checked).
  # 3. If smaller, it finds the correct position within the sorted list, shifts all the larger values up to make a space, and inserts into that correct position.
  # 4. If larger, it leaves the element in place and moves to the next.

# Process:
  # [5, 3, 1, 2, 4]
  # [5] | [3, 1, 2, 4]
  # [3, 5] | [1, 2, 4]
  # [3, 1, 5] | [2, 4]
  # [1, 3, 5] | [2, 4]
  # [1, 3, 2, 5] | [4]
  # [1, 2, 3, 5] | [4]
  # [1, 2, 3, 4, 5]

class Array
  def insertion_sort
    1.upto(size - 1) do |i| # 1. iterate up the array
      while i > 0
        j = i - 1
        if self[i] < self[j] # 2. compares first unsorted value against largest value in sorted
          self[i], self[j] = self[j], self[i] # 3. if smaller, it inserts itself into this position.
          i -= 1
        else
          break # 4. if larger, it leaves the element in place and moves to the next
        end
      end
    end
    self
  end
end

arr = [199, 1, -30, 500, 60, 72, 8, 9, 11]
brr = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
crr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

puts arr.insertion_sort.inspect
puts brr.insertion_sort.inspect
puts crr.insertion_sort.inspect

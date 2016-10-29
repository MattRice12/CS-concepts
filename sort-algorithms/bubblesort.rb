class Array
  def bubblesort
    return [] if empty?
    n = 0
    (size - 1).times do
      swapped = false
      each_with_index do |val, i|
        unless self[i + 1] == nil
          if self[i] > self[i + 1]
            self[i], self[i + 1] = self[i + 1], self[i]
            swapped = true
          end
        end
        n += 1
      end
      break if not swapped
    end
    "#{self} ---- sorted in #{n} steps"
  end

  def bubblesort_two
    return [] if empty?
    n = 0
    loop do
      swapped = false
      (size - 1).times do |i|
        if self[i] > self[i + 1]
          self[i], self[i + 1] = self[i + 1], self[i]
          swapped = true
        end
        n += 1
      end
      break if not swapped
    end
    "#{self} ---- sorted in #{n} steps"
  end
end

arr = [199, 1, -30, 500, 60, 72, 8, 9, 11]
arr_two = [199, 1, -30, 500, 60, 72, 8, 9, 11]

brr = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
brr_two = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

crr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
crr_two = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

puts arr.bubblesort.inspect
puts arr_two.bubblesort_two.inspect

puts brr.bubblesort.inspect
puts brr_two.bubblesort_two.inspect

puts crr.bubblesort.inspect
puts crr_two.bubblesort_two.inspect

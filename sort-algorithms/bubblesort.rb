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

puts arr.bubblesort.inspect
puts arr_two.bubblesort_two.inspect

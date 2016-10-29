class Array
  def selection_sort
    (size - 1).times do |i|
      min = i
      ((i + 1)..(size - 1)).map do |j|
        min = j if self[j] < self[min]
      end
      self[min], self[i] = self[i], self[min] if min != i
    end
    self
  end
end

arr = [199, 1, -30, 500, 60, 72, 8, 9, 11]
brr = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
crr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

puts arr.selection_sort.inspect
puts brr.selection_sort.inspect
puts crr.selection_sort.inspect

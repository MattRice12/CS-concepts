class Array
  def bubblesort
    return [] if empty?
    size.times do
      each_with_index do |val, i|
        unless (i + 1) >= size
          self[i], self[i + 1] = self[i + 1], self[i] if self[i] > self[i + 1]
        end
      end
    end
    self
  end
end

arr = [199, 1, -30, 500, 60, 72, 8, 9, 11]

puts arr.bubblesort.inspect

class Array
  def bubblesort
    return [] if empty?
    size.times do
      self.each_with_index.map do |val, i|
        unless (i + 1) >= size
          if self[i] > self[i + 1]
            self[i], self[i + 1] = self[i + 1], self[i]
          end
        end
      end
    end
    self
  end
end

arr = [199, 1, -30, 500, 60, 72, 8, 9, 11]

puts arr.bubblesort.inspect

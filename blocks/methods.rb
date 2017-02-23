def new_method
  "Hi there"
end

def array_method
  [1, 2, 3, 4, 5]
end

puts new_method
puts send(:new_method)
puts method(:new_method).call

puts "\n"

puts new_method.upcase
puts new_method.send(:upcase)
puts new_method.method(:upcase).call

puts "\n"

puts array_method.join
puts array_method.send(:join)
puts array_method.method(:join).call

puts "\n"

puts 12.method(:+).call(5)

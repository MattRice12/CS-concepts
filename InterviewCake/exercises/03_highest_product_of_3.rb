# Given an array of integers, find the highest product you can get from 3 integers

# "Greedy"
# "Time: O(n)"
# "Space: O(1)"
def my_function(arr)
  if arr.length < 3
    raise Exception, "Less than 3 items!"
  end

  highest = [arr[0], arr[1]].max
  lowest = [arr[0], arr[1]].min

  highest_product_of_two = arr[0] * arr[1]
  lowest_product_of_two = arr[0] * arr[1]

  highest_product_of_three = arr[0] * arr[1] * arr[2]

  arr.each_with_index do |n, i|
    next if i < 2

    highest_product_of_three = [
      highest_product_of_three,
      n * highest_product_of_two,
      n * lowest_product_of_two
    ].max

    highest_product_of_two = [
      highest_product_of_two,
      n * highest,
      n * lowest
    ].max

    lowest_product_of_two = [
      lowest_product_of_two,
      n * highest,
      n * lowest
    ].min

    highest = [highest, n].max
    lowest = [lowest, n].min
  end
  return highest_product_of_three
end

arg = [1, 3, -5, 7, 9, -44, 2, 8]

num = 10000

puts
beginning_time = Time.now
puts "Greedy"
puts "Time: O(n)"
puts "Space: O(1)"
puts my_function(arg)
num.times do
  my_function(arg)
end
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"

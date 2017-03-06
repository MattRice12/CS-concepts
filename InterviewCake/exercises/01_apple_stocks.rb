# Brute force -- "Enumerate all possible solutions":
  # Iterate (1) through stocks array taking |n|
  # Iterate (2) through stocks array taking |o|
  # subtract o from n to get the difference for every time range
  # Push these differences into an array
  # Iterate through new array to find the largest value
# Time: O(n^2)
def my_function_brute(arg)
  new_arr = []
  arg.each_with_index do |n, i|
    arg[i+1..-1].each do |o|
      new_arr.push(o - n)
    end
  end
  max_value = new_arr.max
  return "Best Profit: #{max_value}"
end

# Greedy -- "Keep track of the best answer 'so far,' in one pass through the input."
# Time: O(n)
def my_function(arg)
  first = arg[0]
  max_profit = arg[1] - first
  arg.each_with_index do |n, i|
    next if i == 0
    potential_profit = n - first
    max_profit = [potential_profit, max_profit].max
    first = n if n < first
  end
  return "Best Profit: #{max_profit}"
end

############################################
# stocks = [10, 7, 5, 8, 11, 9]
# stocks = [2, 55, 200, 1, 100, 18, 19, 99, 101]
stocks = [4, 3, 2, 1]

puts
beginning_time = Time.now
puts "** Brute Force - O(n^2) **"
puts my_function_brute(stocks)
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"
puts

beginning_time = Time.now
puts "** Greedy - O(n) **"
puts my_function(stocks)
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"

def my_function(arr)
  final_arr = []
  arr.each do |n|
    new_arr = arr - [n]
    product = new_arr.reduce(:*)
    final_arr.push(product)
  end
  return "Products: #{final_arr}"
end

def my_function2(arr)
  final_arr = []
  first_half = []
  first_product = 1
  last_half = []
  arr.each_with_index do |n, i|
    first_half = arr[0...i]
    last_half = arr[i+1..-1]
    first_product = first_half.reduce(:*) || 1
    last_product = last_half.reduce(:*) || 1
    products = first_product * last_product
    final_arr.push(products)
  end
  return "Products: #{final_arr}"
end

def my_function3(arr)
  final_arr = []
  first_product = 1
  last_half = []
  arr.each_with_index do |n, i|
    last_half = arr[i+1..-1]
    first_product *= arr[i-1] unless i == 0
    last_product = last_half.reduce(:*) || 1
    products = first_product * last_product
    final_arr.push(products)
  end
  return "Products: #{final_arr}"
end

arg = [1, 3, 5, 7, 11]

puts
beginning_time = Time.now
puts "Brute Force"
puts my_function(arg)
10000.times do
  my_function(arg)
end
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"

puts
beginning_time = Time.now
puts my_function2(arg)
10000.times do
  my_function2(arg)
end
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"

puts
beginning_time = Time.now
puts my_function3(arg)
10000.times do
  my_function3(arg)
end
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"

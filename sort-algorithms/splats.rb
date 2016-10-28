def go(x, *args, y)
  puts x # => 1
  puts y # => 5
  puts args.inspect # => [2,3,4]
end

go(1, 2, 3, 4, 5)

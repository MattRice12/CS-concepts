arr = (1..10).to_a

arr.select(&:even?)

arr.select { |x| x.even? }

arr.select do |x|
  x.even?
end


#_______________________________

arr = ["asdf", 1, 3, "asdf", 3, 4, 7, true, 3]
arr.delete(3)
#=> 3
#arr == ["asdf", 1, "asdf", 4, 7, true]

arr = ["asdf", 1, 3, "asdf", 3, 4, 7, true, 3]
arr.delete_at(3)
#=> "asdf"
#arr == ["asdf", 1, 3, 3, 4, 7, true, 3]

arr = ["asdf", 1, 3, "asdf", 3, 4, 7, true, 3]
y = arr.delete_at(3)
#=> "asdf"
#y == "asdf"
#arr == ["asdf", 1, 3, 3, 4, 7, true, 3]

arr = [1, 3, 3, 4, 7, 3]
arr.delete_if {|average| average > 3}
#=> [1, 3, 3, 3]
#=> arr == [1, 3, 3, 3]

arr = [1, 2, 3, 4, 5, 6, 7, 8, 312, 44, 11, 2]

arr.inject(&:+)
arr.inject {|sum, x| sum + x }
#=> 405

arr.inject(10, &:+)
arr.inject(10, :+)
arr.inject(10) {|sum, x| sum + x }
arr.reduce(10, :+)
#=> 415


arr.inject(&:-)
#=> -403

arr.inject(&:*)
#=> 12177285120

arr.inject(&:/)


# Inject and Reduce are the same thing

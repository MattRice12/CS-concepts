# 1) Divide the unsorted list into n sublists, each containing 1 element (a list of 1 element is considered sorted).
# 2) Repeatedly merge sublists to produce new sorted sublists until there is only 1 sublist remaining. This will be the sorted list.

def mergesort(arr)
  # arr_new = arr.partition { |i| (arr.index(i) + 1) <= (arr.length / 2)}
  arr_new = recursive_partition(arr)
  print arr_new
end

def recursive_partition(arr)
  arr = arr.partition { |i| (arr.index(i) + 1) <= (arr.length / 2)}
  arr = arr.map do |a|
    a = recursive_partition(a) unless a.length <= 1
    a
  end
  arr
end

mergesort([1, 7, 10, 5, 3, 2, 6, 9, 11])

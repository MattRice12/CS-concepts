# 1) Divide the unsorted list into n sublists, each containing 1 element (a list of 1 element is considered sorted).
# 2) Repeatedly merge sublists to produce new sorted sublists until there is only 1 sublist remaining. This will be the sorted list.

def merge_sort(list)
  return list if list.length <= 1
  mid = (list.length / 2).floor
  left = merge_sort(list[0..mid - 1])
  right = merge_sort(list[mid..list.length])
  merge(left, right)
end

def merge(left, right)
  return right if left.empty?
  return left if right.empty?
  return [left.first] + merge(left[1..left.length], right) if left.first < right.first
  [right.first] + merge(left, right[1..right.length])
end

print merge_sort([1, 7, 10, 5, 3, 2, 6, 9, 11])
puts
print merge_sort([])
puts
print merge_sort([44, 99, 1, -30, 10023, 45])
puts
print merge_sort([1, 1, 1, 1, 1, 1])

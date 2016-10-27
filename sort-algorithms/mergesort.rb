# 1) Divide the unsorted list into n sublists, each containing 1 element (a list of 1 element is considered sorted).
# 2) Repeatedly merge sublists to produce new sorted sublists until there is only 1 sublist remaining. This will be the sorted list.

def merge_sort(arr)
  if arr.length <= 1
    arr
  else
    mid = (arr.length / 2).floor
    left = merge_sort(arr[0..mid - 1])
    right = merge_sort(arr[mid..arr.length])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else
    [right.first] + merge(left, right[1..right.length])
  end
end

print merge_sort([1, 7, 10, 5, 3, 2, 6, 9, 11])

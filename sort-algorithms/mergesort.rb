# 1) Divide the unsorted list into n sublists, each containing 1 element (a list of 1 element is considered sorted).
# 2) Repeatedly merge sublists to produce new sorted sublists until there is only 1 sublist remaining. This will be the sorted list.

def mergesort(arr)
  n = 0
  while n < arr.length
    compare_arr = [arr[n], arr[n + 1]]
    return print arr if compare_arr[1] == nil
    if compare_arr[0] > compare_arr[1]
      arr[n] = compare_arr[1]
      arr[n + 1] = compare_arr[0]
    end
    n += 2
  end
  print arr
end

mergesort([1, 7, 10, 5, 3, 2, 6, 9])

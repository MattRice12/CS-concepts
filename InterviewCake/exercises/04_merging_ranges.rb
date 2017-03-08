# Write a function merge_ranges() that takes an array of meeting time ranges and returns an array of condensed ranges.
  # ##Start   [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ]
  # =>Fin     [ [0, 1], [3, 8], [9, 12] ]

def my_function(arr)
  i = 0
  while i < arr.length - 1
    two_ranges = [arr[i], arr[i+1]]
    first = two_ranges.min
    last = two_ranges.max
    if first[1] >= last[1]
      arr[i] = first
      arr.slice!(i+1)
    elsif first[1] >= last[0]
      unless first[1] >= last[1]
        arr[i] = [first[0], last[1]]
      end
      arr.slice!(i+1)
    else
      i += 1
    end
  end
  return arr
end


def my_function_2(arr)
   sorted_meetings = arr.sort

   # initialize merged_meetings with the earliest meeting
   merged_meetings = [sorted_meetings[0]]

   sorted_meetings[1..-1].each do |current_meeting_start, current_meeting_end|

       last_merged_meeting_start, last_merged_meeting_end = merged_meetings[-1]

       # if the current and last meetings overlap, use the latest end time
       if current_meeting_start <= last_merged_meeting_end
           merged_meetings[-1] = [last_merged_meeting_start, [last_merged_meeting_end, current_meeting_end].max]

       # add the current meeting since it doesn't overlap
       else
           merged_meetings.push([current_meeting_start, current_meeting_end])
       end
   end

   return merged_meetings
end

arg = [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ]
arg2 = [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ]
  #=> [ [0, 1], [3, 8], [9, 12] ]

# arg = [ [0, 2], [1, 5], [6, 10], [6, 11] ]
# arg2 = [ [0, 2], [1, 5], [6, 10], [6, 11] ]
  #=> [ [0, 5], [6, 11]]

# arg = [ [1, 2], [2, 3] ]
# arg2 = [ [1, 2], [2, 3] ]
  #=> [ [1, 3] ]

# arg = [ [1, 5], [2, 3] ]
# arg2 = [ [1, 5], [2, 3] ]
  #=> [ [1, 5] ]

# arg = [ [1, 10], [2, 6], [3, 5], [7, 9] ]
# arg2 = [ [1, 10], [2, 6], [3, 5], [7, 9] ]
  #=> [ [1, 10] ]

num = 10000

puts
beginning_time = Time.now
puts "Greedy - Mineeee"
puts "Start: #{arg}"
puts "End:   #{my_function(arg)}"
num.times do
  arg = [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ]
  my_function(arg)
end
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"

puts
beginning_time = Time.now
puts "Greedy - InterviewCake - Faster than mine :( BARELY"
puts "Start: #{arg2}"
puts "End:   #{my_function_2(arg2)}"
num.times do
  arg2 = [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ]
  my_function_2(arg2)
end
end_time = Time.now
puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"

############################################################################
# Bubble sort implementation written by Andrew Mayne
# Input: 35 -8 11 1 68 0 3
# Output: -8 0 1 3 11 35 68
############################################################################
# 1. Step through list and swap items that are out of order
# 2. Repeat till no more swaps
############################################################################

def read_line
  gets.strip.split(' ').map(&:to_i)
end

def bubble_sort(list)
  return list if list.size <= 1
  
  loop do
    swapped = false
    1.upto(list.size-1) do |i|
      if list[i-1] > list[i]
        list[i-1], list[i] = list[i], list[i-1]
        swapped = true
      end
    end
    break unless swapped
  end
  list
end

list = read_line

bubble = bubble_sort(list)

puts bubble.join(" ") + "\n"
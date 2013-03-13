############################################################################
# Quick sort implementation written by Andrew Mayne
# Input: 35 -8 11 1 68 0 3
# Output: -8 0 1 3 11 35 68
############################################################################
# 1. Pick a pivot (I chose 0)
# 2. Reorder elements to the left & right partitions of pivot based on value
# 3. Recursively apply till size = 1 and the merge result
############################################################################

def read_line
  gets.strip.split(' ').map(&:to_i)
end

def quick_sort(list)
  return list if list.empty?
  left = []
  right = []
  pivot = list[0]
  for i in 1..list.size-1
    list[i] < pivot ?  left << list[i] : right << list[i]
  end
  return quick_sort(left).push(pivot).concat(quick_sort(right))
end

list = read_line

quick = quick_sort(list)

puts quick.join(" ") + "\n"
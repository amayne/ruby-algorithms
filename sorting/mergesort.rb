############################################################################
# Merge sort implementation written by Andrew Mayne
# Input: 35 -8 11 1 68 0 3
# Output: -8 0 1 3 11 35 68
############################################################################
# 1. Divide unsorted lists into n sublist each containing 1 element
# 2. Repeatedly merge sublist to produce sorted list
############################################################################

def read_line
  gets.strip.split(' ').map(&:to_i)
end

def split_array a
  mid = (a.size / 2).round
  [a.take(mid), a.drop(mid)]
end

def merge_sort(list)
  return list if list.size <= 1
  l, r = split_array(list)
  result = merge(merge_sort(l), merge_sort(r))
end

def merge(left, right)
  return left if right.empty?
  return right if left.empty?
  smallest = left.first <= right.first ? left.shift : right.shift
  merge(left,right).unshift(smallest)
end

list = read_line

merged = merge_sort(list)

puts merged.join(" ")
def center_mass(staff)
  sum = 0
  weighted_sum = 0
  staff.each { |w| sum += w }
  staff.each_with_index { |w, i| weighted_sum += w * (i+1) }
  center_mass = weighted_sum.to_f / sum.to_f
  center = (staff.size.to_f+1.0) / 2.0
  balanced = false
  #print "center #{center} center_mass #{center_mass}, #{staff}\n"
  if center == center_mass
    balanced = true
  end
  balanced
end

def print_staff(left_index, right_index, length)
  puts "#{left_index} #{right_index} #{length}"
end

def read_line
  gets.strip.split('').map(&:to_i)
end

def find_solution
  branch = read_line
  max_length = branch.size/2
  max_length.downto(1) { |len|
    remainder = branch.size - len*2
    0.upto(remainder) { |left_offset| 
      left = branch[left_offset..len+left_offset-1]
      right_remainder = remainder - left_offset
      right_remainder.downto(0) { |right_offset| 
        right = branch[branch.size-right_offset-len..branch.size-right_offset-1]
        tmp = left+right
        balanced = center_mass(tmp)
        tmp_rev1 = left+right.reverse
        balanced_rev1 = center_mass(tmp_rev1)
        tmp_rev2 = left.reverse+right
        balanced_rev2 = center_mass(tmp_rev2)
        if balanced || balanced_rev1 || balanced_rev2
          print_staff(left_offset,branch.size-right_offset-len,len)
          exit
        end
      }
    }
  }
end

find_solution
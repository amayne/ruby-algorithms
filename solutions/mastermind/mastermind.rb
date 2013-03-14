require 'set'

class TestCase
  attr_accessor :guesses, :scores, :sequence_length, :guess_range, :guess_num
  
  def initialize(sequence_length, guess_range, guess_num)
    @sequence_length = sequence_length
    @guess_range = guess_range
    @guess_num = guess_num
    @guesses = []
    @scores = {}
  end
  
  
  def evaluate
    possibilities = Array.new(sequence_length) { Set.new() }
    for i in 0..sequence_length-1
     for j in 1..guess_range
       possibilities[i] << j
     end
    end
    pass = true
    scores.sort_by {|k,v| k}.reverse.each do |score|
      if possibilities.nil?
        pass = false
        break
      end
      score = score[0]
      i = scores[score]
      if score == 0
        guesses[i].each_with_index do |guess, j|
          if not possibilities[j].nil? && possibilities[j].include?(guess)
            possibilities[j].delete?(guess)
          else
            pass = false
            break
          end
        end
      elsif score == sequence_length
        possibilities = nil
      else
        guesses[i].each_with_index do |guess, j|
          if possibilities[j].nil? || !possibilities[j].include?(guess)
            pass = false
            break
          end
        end
      end
    end
    if pass 
      puts "Yes"
    else
      puts "No"
    end
  end
end

def read_line
  gets.strip.split(" ").map(&:to_i)
end


def find_solution
  # possible subsets, reduce space each time
  test_num = read_line.first
  
  tests = []
  for i in 1..test_num
    sequence_length, guess_range, guess_num  = read_line
    test_case = TestCase.new(sequence_length, guess_range, guess_num)
    for i in 1..guess_num
      tmp = read_line
      test_case.guesses << tmp[0..sequence_length-1]
      test_case.scores[tmp[sequence_length]] = i-1
    end
    tests << test_case    
  end
  
  for test in tests
    test.evaluate
  end
end

find_solution
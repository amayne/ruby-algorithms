require 'set'

def read_dictionary(n)
#  counter = 1
  graph = {}
  file = File.new("dictionary.txt", "r")
  while (line = file.gets)
    word = line.strip
    if word.length == n
      for i in 0..n
        bucket = word[0..i] + "_"
        unless word[i+1..n-1].nil?
          bucket = bucket + word[i+1..n-1]
        end
        if graph.has_key?(bucket)
          graph[bucket] << word
        else
          graph[bucket] = [ word ]  
        end
      end
    end
  end
  file.close
  graph
end

def find_solution 
  start = gets.strip
  finish = gets.strip
  graph = read_dictionary(start.length)
  
  puts graph.keys.size
  seen_words = Set.new
  
  found = false
#  until found do
    
#  end
end

find_solution
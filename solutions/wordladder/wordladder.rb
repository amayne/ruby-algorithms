require 'set'

class Vertex
  attr_accessor :name, :children, :visited, :moves
  
  def initialize(name)
    @name = name
    @visited = false
    @moves = []
    @children = []
  end
  
  def visit(moves)
    @visited = true
    @moves = moves
  end
  
  def ==(other)
    name = other.name
  end
end

class Graph
  attr_accessor :vertices
  def initialize()
    @vertices = {}
  end
  
  def add_vertex(v)
    vertices[v] = Vertex.new(v)
  end
  
  def add_edge(v1, v2)
    vertices.has_key?(v1) ? vertex1 = vertices[v1] : vertex1 = add_vertex(v1)
    vertices.has_key?(v2) ? vertex2 = vertices[v2] : vertex2 = add_vertex(v2)
    vertex1.children << vertex2
    vertex2.children << vertex1
  end
  
end

def read_dictionary(n)
#  counter = 1
  dict = {}
  graph = Graph.new
  file = File.new("dictionary.txt", "r")
  while (line = file.gets)
    word = line.strip
    if word.length == n
      for i in 0..n-1
        bucket = word[0,i] + "_"
        unless word[i+1,n-i].nil?
          bucket = bucket + word[i+1,n-i]
        end
        if dict.has_key?(bucket)
          dict[bucket] << word
        else
          dict[bucket] = [ word ]  
        end
      end
    end
  end
  for bucket in dict.keys
    for word1 in dict[bucket]
      for word2 in dict[bucket]
        if word1 != word2
          graph.add_edge(word1,word2)
        end
      end
    end
  end
  file.close
  #puts graph.vertices.size
  graph
end

def find_solution 
  start = gets.strip
  finish = gets.strip
  graph = read_dictionary(start.length)
  
  start_node = graph.vertices[start]
  finish_node = graph.vertices[finish]
  
  queue = Array.new

  queue.push(start_node)
  
  seen_nodes = Set.new
  
  found_node = nil
  
  while found_node.nil? do
    break if queue.empty?
    current = queue.pop
    current.children.each do |child|
      seen_nodes << current
      unless child.visited
        #print child.name
        moves = current.moves.dup
        moves << "#{child.name} "
        child.visit(moves)
        if child.name == finish_node.name
          found_node = child
          break
        end
        unless queue.include?(child) || seen_nodes.include?(child)
          queue.push(child)
        end
      end 
    end
  end
  if found_node.nil?
    puts "no word ladders found"
  else    
    puts "found #{found_node.name}!"
    puts start_node.name
    puts found_node.moves
  end
  
end

find_solution
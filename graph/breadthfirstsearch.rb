############################################################################
# A Breadth First Search implementation written by Andrew Mayne
# Input (Adjacency List): 1:2,5.2:1,5,4,3.3:2,4.4:2,3,5.5:1,2,4
############################################################################
# 1. Divide unsorted lists into n sublist each containing 1 element
# 2. Repeatedly merge sublist to produce sorted list
############################################################################

class Node
  attr_accessor :name, :children, :visited, :distance  
  
  def initialize(name, children = [])
    @name = name
    @children = children
    @visited = false
    @distance = 0
  end 
end 

def BFS(graph, start)
  queue = Array.new
  queue.push(start) # add s to queue
  start.visited = true
  puts "starting node: #{start.name}"
  loop do
    break if queue.empty? # while Q not empty
    current = queue.pop  # pop the first node v
    current.children.each do |child| # for each edge (v,w)
      child_node = graph[child]
      unless child_node.visited # if w unexplored
        puts "found #{child_node.name}"
        child_node.visited = true # mark w as explored
        queue.push(child_node) # push w to end of the Q
      end
    end
  end
end


def read_line
  gets.strip.split('.')
end

def build_graph(list)
  start_node = nil
  graph = {}
  list.each_with_index do |line,i|
    name, elem = line.split(":")
    children = elem.split(",")
    node = Node.new(name, children)
    graph[name] = node
    start_node = node if i == 0 
  end
  return start_node, graph
end

list = read_line

start, graph = build_graph(list)

BFS(graph, start)

#puts merged.join(" ")
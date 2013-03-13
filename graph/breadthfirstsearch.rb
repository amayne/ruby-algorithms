############################################################################
# A Breadth First Search implementation written by Andrew Mayne
# Input (Adjacency List): 1:2,5.2:1,5,4,3.3:2,4.4:2,3,5.5:1,2,4
# Output: 1, 2, 5, 4, 3 
############################################################################

require './graph'

def BFS(graph, start)
  queue = Array.new
  queue.push(start) # add s to queue
  start.visited = true
  puts "starting node: #{start.name}"
  loop do
    break if queue.empty? # while Q not empty
    current = queue.pop  # pop the first node v
    current.children.each do |child| # for each edge (v,w)
      child_vertex = graph[child]
      unless child_vertex.visited # if w unexplored
        puts "found #{child_vertex.name}"
        child_vertex.visit # mark w as explored
        queue.push(child_vertex) # push w to end of the Q
      end
    end
  end
end

def read_line
  gets.strip.split('.')
end

def build_graph(list)
  start_vertex = nil
  graph = Graph.new
  list.each_with_index do |line,i|
    name, elem = line.split(":")
    edges = elem.split(",")
    vertex = Vertex.new(name, edges)
    graph.add(vertex)
    start_vertex = vertex if i == 0 
  end
  return start_vertex, graph
end

list = read_line

start, graph = build_graph(list)

BFS(graph, start)


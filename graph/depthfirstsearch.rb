############################################################################
# A Simple Depth First Search implementation written by Andrew Mayne
# Input (Adjacency List): 1:2,5.2:1,5,4,3.3:2,4.4:2,3,5.5:1,2,4
# Output: 1, 2, 5, 4, 3 
############################################################################

require './graph'

def DFS(graph, vertex)
  puts vertex.name
  vertex.visit
  vertex.children.each do |childn|
    child = graph[childn]
    unless child.visited
      DFS(graph, child)
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
    children = elem.split(",")
    vertex = Vertex.new(name, children)
    graph.add(vertex)
    start_vertex = vertex if i == 0 
  end
  return start_vertex, graph
end

list = read_line

start, graph = build_graph(list)

DFS(graph, start)


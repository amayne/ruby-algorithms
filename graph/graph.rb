# Graph

require './vertex'

class Graph
  attr_accessor :vertices
  
  def initialize(vertices = {})
    @vertices = vertices
  end
  
  def add v
    @vertices[v.name] = v
  end
  
  def remove v
    @vertices.delete(v)
  end
  
  def [](vertex)
    @vertices[vertex]
  end
end

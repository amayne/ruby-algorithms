# Vertex


class Vertex
  attr_accessor :name, :parent, :children, :visited
  
  def initialize(name, children = [])
    @name = name
    @children = children
    @visited = false
  end 
  
  def visit 
    @visited = true
  end
end 


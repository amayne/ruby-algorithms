class Node 
  attr_accessor :configuration, :distance, :moves
  
  def initialize(configuration, moves = [], distance = 0)
    @configuration = configuration
    @moves = moves
    @distance = distance
  end
  
  def ==(other)
    configuration = other.configuration
  end
end 

def read_line
  gets.strip.split(' ').map(&:to_i) # since we're only dealing with numbers
end

def find_solution 
  n, k = read_line
  initial = read_line
  desired = read_line
  
  initial_node = Node.new(initial)
  desired_node = Node.new(desired)
  solution_node = nil
  
  queue = Array.new
  queue << initial_node
  
  current = initial_node
  
  while solution_node.nil? do
    pegs_available = (1..k).to_a
    break if queue.empty?
    current.configuration.each_with_index do |from, i|
      if pegs_available.include? from
        pegs_available.delete from
        break if pegs_available.empty?
        pegs_available.each do |to|
          configuration = current.configuration.dup
          configuration[i] = to

          moves = current.moves.dup
          moves << "#{ from } #{ to }"

          node = Node.new(configuration, moves)
          if node.configuration == desired_node.configuration
              solution_node = node 
          else
            queue << node
          end 
        end
      end
    end            
    current = queue.shift
  end    
  solution_node
end 


solution = find_solution

puts solution.moves.count
puts solution.moves

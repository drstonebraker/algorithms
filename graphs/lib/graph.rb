class Vertex
  attr_reader :value
  attr_accessor :in_edges, :out_edges

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end

  def inspect
    "#<Vertex: @value=#{@value.inspect}"
  end
end

class Edge
  attr_reader :from_vertex, :to_vertex, :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    from_vertex.out_edges << self
    to_vertex.in_edges << self
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost
  end

  def destroy!
    @from_vertex.out_edges.delete(self)
    @to_vertex.in_edges.delete(self)
    @from_vertex = nil
    @to_vertex = nil
  end

  # def inspect
  #   "#<Edge: @from_vertex=#{@from_vertex.inspect} @to_vertex"
  # end
end

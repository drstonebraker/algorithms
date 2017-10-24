class Vertex
  attr_reader :value
  attr_accessor :in_edges, :out_edges

  def initialize(value)
    @value = value
    @in_edges = Set.new
    @out_edges = Set.new
  end
end

class Edge
  def initialize(from_vertex, to_vertex, cost = 1)
    from_vertex.out_edges.add(self)
    to_vertex.in_edges.add(self)
    @from = from_vertex
    @to = to_vertex
    @cost = cost
  end

  def destroy!
    @from.out_edges.remove(self)
    @to.in_edges.remove(self)
    @from = nil
    @to = nil
  end
end

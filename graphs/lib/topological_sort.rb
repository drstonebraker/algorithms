require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []
  edge_counts = Hash.new(0)
  vertices.each {|v| edge_counts[v] = v.in_edges.size}

  check_edge = Proc.new do |edge|
    to_vertex = edge.to_vertex
    edge_counts[to_vertex] -= 1
    return [] if edge_counts[to_vertex] < 0
    queue << to_vertex if edge_counts[to_vertex].zero?
  end

  vertices.each_with_index do |vertex, idx|
    if vertex.in_edges.empty?
      sorted << vertex
      vertex.out_edges.each(&check_edge)
    end
  end
  until queue.empty?
    current_vertex = queue.shift

    sorted << current_vertex
    current_vertex.out_edges.each(&check_edge)
  end

  p edge_counts
  sorted
end

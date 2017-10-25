require_relative 'graph'
require 'byebug'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []

  vertices.each_with_index do |vertex, idx|
    if vertex.in_edges.empty?
      # debugger
      sorted << vertex
      vertex.out_edges.each do |edge|
        to_vertex = edge.to_vertex
        edge.destroy!
        queue << to_vertex if to_vertex.in_edges.empty?
      end
    end
  end
  debugger
  until queue.empty?
    current_vertex = queue.shift

    sorted << current_vertex
    current_vertex.out_edges.each do |edge|
      queue << edge.to_vertex
      edge.destroy!
    end

  end

  sorted
end

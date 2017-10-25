require 'byebug'

class DynamicProgramming

  def initialize
    @blair_nums = {1 => 1, 2 => 2}
    @frog_hops = {
      1 => [[1]],
      2 => [[1,1], [2]],
      3 => [[1,1,1], [1,2], [2,1], [3]]
    }
    @super_frog_hops = {
      0 => [[]],
      1 => [[1]]
    }
  end

  # def blair_nums(n)
  #   return @blair_nums[n] if @blair_nums[n]
  #   result = blair_nums(n - 1) + blair_nums(n - 2) + blair_odd(n)
  #   @blair_nums[n] = result
  # end

  def blair_nums(n)
    cache = blair_cache_builder(n)
    cache[n]
  end

  def blair_cache_builder(n)
    cache = {1 => 1, 2 => 2}
    (3..n).each do |val|
      cache[val] = cache[val - 1] + cache[val - 2] + blair_odd(val)
    end
    cache
  end

  def blair_odd(k)
    (k - 1) * 2 - 1
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = {
      1 => [[1]],
      2 => [[1,1], [2]],
      3 => [[1,1,1], [1,2], [2,1], [3]]
    }
    (4..n).each do |val|
      cache[val] = [1, 2, 3].flat_map do |first_hop|
        cache[val - first_hop].map {|hops| [first_hop] + hops}
      end
    end
    cache
  end

  def frog_hops_top_down(n)
    @frog_hops[n] = frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    return @frog_hops[n] if @frog_hops[n]

    [1, 2, 3].flat_map do |first_hop|
      frog_hops_top_down_helper(n - first_hop).map {|hops| [first_hop] + hops}
    end
  end

  def super_frog_hops(n, k)
    return @super_frog_hops[n] if @super_frog_hops[n]

    @super_frog_hops[n] = (1..k).flat_map do |first_hop|
      if first_hop > n
        []
      else
        super_frog_hops(n - first_hop, k).map {|hops| [first_hop] + hops}
      end
    end
  end

  def super_frog_hops(n, k)
    cache = super_frog_cache_builder(n, k)
    cache[n]
  end

  def super_frog_cache_builder(input, k)
    cache = {
      0 => [[]],
      1 => [[1]]
    }

    (2..input).each do |n|
      cache[n] = (1..k).flat_map do |first_hop|
        if first_hop > n
          []
        else
          cache[n - first_hop].map {|hops| [first_hop] + hops}
        end
      end
    end
    cache
  end

  def knapsack(weights, values, capacity)
    table = knapsack_table(weights, values, capacity)
    table.last.last
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    mapped_weights = weights.zip(values).sort
    num_items = weights.length
    table = Array.new(capacity.next) { Array.new(num_items) }

    (0..capacity).each do |capacity|
      mapped_weights.each_with_index do |(weight, val), col|
        if weight <= capacity
          remaining_capacity = capacity - weight
          tot_val = val
          tot_val += table[remaining_capacity][col.pred] if col > 0
          table[capacity][col] = tot_val
        else
          prev_item = col > 0 ? table[capacity][col.pred] : -1.0/0
          prev_capacity = capacity > 0 ? table[capacity.pred][col] : -1.0/0
          table[capacity][col] = [prev_item, prev_capacity, 0].max
        end
      end
    end

    table
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end

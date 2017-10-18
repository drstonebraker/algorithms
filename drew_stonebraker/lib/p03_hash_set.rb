require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count >= num_buckets
    bucket = self[key]
    unless bucket.include?(key)
      @count += 1
      bucket << key
    end
    key
  end

  def remove(key)
    bucket = self[key]
    @count -= 1
    bucket.delete(key)
  end

  def include?(key)
    self[key].include?(key)
  end

  private

  def [](key)
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    flat_store = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    flat_store.each {|key| self.insert(key)}
    nil
  end
end

require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count

  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if include?(key)
      bucket(key).update(key, val)
    else
      resize! if count >= num_buckets
      bucket(key).append(key, val)
      @count += 1
    end
    val
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      @count -= 1
      bucket(key).remove(key)
    end
  end

  def each(&prc)
    @store.each do |bucket|
      bucket.each do |node|
        prc.call(node.key, node.val)
      end
    end
    self
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_hash_map = HashMap.new(num_buckets * 2)
    self.each do |k, v|
      new_hash_map[k] = v
    end
    self.store = new_hash_map.store
    nil
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end

  protected
  attr_reader :store
end

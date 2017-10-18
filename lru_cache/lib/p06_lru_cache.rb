require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    node = @map[key]
    if node
      update_node!(node)
    else
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    eject! if count >= @max
    val = @prc.call(key)
    @store.append(key, val)
    @map[key] = @store.last
    val
  end

  def update_node!(node)
    key = node.key
    @store.remove(key)
    @store.append(key, node.val)
  end

  def eject!
    node = @store.first
    node.remove
    @map[node.key] = nil
  end
end

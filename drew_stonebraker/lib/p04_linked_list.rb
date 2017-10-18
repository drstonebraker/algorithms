require 'byebug'

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    node = Node.new(key, val)
    last.next = node
    node.prev = last
    @tail.prev = node
    node.next = @tail
    node
  end

  def update(key, val)
    node = find{|node| node.key == key}
    node.val = val if node
  end

  def remove(key)
  end

  def each(&prc)
    current = first
    while current.key
      prc.call(current)
      current = current.next
    end
    self
  end

  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end

# Post Order Traversal:


# Pre Order Traversal:


# LCA:
# In a binary search tree, an *ancestor* of a `example_node` is a node
# that is on a higher level than `example_node`, and can be traced directly
# back to `example_node` without going up any levels. (I.e., this is
# intuitively what you think an ancestor should be.) Every node in a binary
# tree shares at least one ancestor -- the root. In this exercise, write a
# function that takes in a BST and two nodes, and returns the node that is the
# lowest common ancestor of the given nodes. Assume no duplicate values.


# implement an in order traversal iteratively.
# no need to return the array of elements, just print out the node's
# value in the correct order

def in_order_traversal(root)
  cache = [root]
  result = []

  until cache.empty?
    current_node = cache.last
    if cache.left
     cache << cache.left
    else
     result << current_node


  end
end

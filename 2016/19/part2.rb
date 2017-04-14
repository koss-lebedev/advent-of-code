class Node < Struct.new(:value, :next, :prev)
end

class Problem

  def initialize(count)

    @size = count
    @head = Node.new(1, nil, nil)
    prev = @head

    (count-1).times do |i|
      node = Node.new(i + 2)
      prev.next = node
      node.prev = prev

      prev = node
    end

    prev.next = @head
    @head.prev = prev
  end

  def solve
    opposite = head
    (size/2).times do
      opposite = opposite.next
    end

    until size == 1
      opposite = delete(opposite)
      self.size -= 1
      opposite = opposite.next if size.even?
    end

    opposite.value
  end

private

  def delete(node)
    next_node = node.next
    node.prev.next = next_node
    next_node.prev = node.prev
    next_node
  end

  attr_accessor :head, :size

end

problem = Problem.new(3014603)
puts problem.solve
# frozen_string_literal: true

class LinkedList
  attr_accessor :head, :size

  def initialize(value = '')
    @head = Node.new(value)
    @size = 0
  end

  # Big O(1) space complexity O(1)
  def add_front(data)
    increment_size

    actual_node = @head
    new_node = Node.new(data)

    if actual_node.value == ''
    else
      new_node.nextNode = actual_node
    end
    @head = new_node
    @head.value
  end

  # Big O(n) space complexity O(n)
  def delete_last
    return 'Empty linkedset' if @size.zero?

    counter = 0
    current_node = @head

    while counter < @size
      if @size - counter == 1
        decrement_size

        current_node.nextNode = ''

        current_node.value = '' if @size.zero?

        return true
      else
        counter += 1
        current_node = current_node.nextNode
      end
    end
  end

  # Big O(n) space complexity O(n)
  def delete_in(pos)
    return 'Not Found' if @size.zero? || pos > @size

    counter = 0
    current_node = @head

    while counter < pos
      if pos - counter == 1
        decrement_size

        current_node.nextNode = current_node.nextNode.nextNode

        current_node.value = '' if @size.zero?

        return true
      else
        counter += 1
        current_node = current_node.nextNode
      end
    end
  end

  # Big O(1) space complexity O(1)
  def get_first
    current_node = @head
    return 'Empty linked list' if current_node.value == ''

    current_node.value
  end

  # Big O(n)
  def get_last
    current_node = @head
    counter = 0

    return current_node.value if @size == 1

    while counter <= @size
      counter += 1

      return current_node.value if current_node.nextNode == ''

      current_node = current_node.nextNode
    end
  end

  # Big O(1) space complexity O(1)
  def clear
    new_node = Node.new

    @head = new_node
    @size = 0

    @head
  end

  # Big O(n) or Big (n log n)
  def addBack(value)
    current_node = @head
    counter = 0
    new_node = Node.new(value)

    if current_node.nextNode == ''
      current_node.nextNode = new_node
      return new_node.value
    end

    while counter <= @size
      counter += 1

      if current_node.nextNode == ''
        current_node.nextNode = new_node
        return current_node.nextNode.value
      end
      current_node = current_node.nextNode
    end

    increment_size
  end

  # Big O(1)
  attr_reader :size

  private

  # Big O(1)
  def increment_size
    @size += 1
  end

  def decrement_size
    @size -= 1
  end
end

class Node
  attr_accessor :value, :nextNode

  def initialize(value = '', next_node = '')
    @value = value
    @nextNode = next_node
  end
end

linked_list = LinkedList.new
linked_list.add_front(2)

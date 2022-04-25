# frozen_string_literal: true

class Stack
  attr_accessor :head, :size

  def initialize(value = '')
    @head = Node.new(value)
    @size = 0
  end

  # Big O(1)
  def push(data)
    increment_size

    actual_node = @head
    new_node = Node.new(data)

    if actual_node == '' || actual_node.value == ''
    else
      new_node.next_node = actual_node
    end
    @head = new_node
    @head.value
  end

  # Big O(1)
  def pop
    decrement_size
    currentNode = @head
    return 'Empty linked list' if currentNode == ''

    @head = currentNode.next_node
    currentNode.value
  end

  # Big O(1)
  def peek
    currentNode = @head
    return 'Empty linked list' if currentNode == ''

    currentNode.value
  end

  # Big O(1)
  def clear
    new_node = Node.new

    @head = new_node
    @size = 0

    @head
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
  attr_accessor :value, :next_node

  def initialize(value = '', next_node = '')
    @value = value
    @next_node = next_node
  end
end

stack = Stack.new

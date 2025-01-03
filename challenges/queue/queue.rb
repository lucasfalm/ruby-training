# frozen_string_literal: true

class Queue
  attr_accessor :head, :size

  def initialize(value = '')
    @head = Node.new(value)
    @tail = Node.new(value)
    @size = 0
  end

  # Out << [2, 1] << new value
  # Big O(1)
  def enqueue(data)
    new_node = Node.new(data)

    @tail.next_node = new_node if @size >= 1

    @tail = new_node

    @head = @tail if @size.zero?

    incrementSize
    @tail.value
  end

  # Big O(1)
  def dequeue
    return 'Empty Queue' if @size.zero?

    current_node = @head

    if @size == 1
      @head = Node.new('')
      @tail = @head
    else
      @head = current_node.next_node
    end

    decrement_size
    current_node.value
  end

  # Big O(1)
  def peek
    return 'Empty Queue' if @size.zero?

    current_node = @head
    current_node.value
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

q = Queue.new

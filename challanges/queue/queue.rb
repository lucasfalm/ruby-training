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
    newNode = Node.new(data)

    @tail.nextNode = newNode if @size >= 1

    @tail = newNode

    @head = @tail if @size.zero?

    incrementSize
    @tail.value
  end

  # Big O(1)
  def dequeue
    return 'Empty Queue' if @size.zero?

    currentNode = @head

    if @size == 1
      @head = Node.new('')
      @tail = @head
    else
      @head = currentNode.nextNode
    end

    decrementSize
    currentNode.value
  end

  # Big O(1)
  def peek
    return 'Empty Queue' if @size.zero?

    currentNode = @head
    currentNode.value
  end

  # Big O(1)
  def clear
    newNode = Node.new

    @head = newNode
    @size = 0

    @head
  end

  # Big O(1)
  attr_reader :size

  private

  # Big O(1)
  def incrementSize
    @size += 1
  end

  def decrementSize
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

q = Queue.new

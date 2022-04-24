# frozen_string_literal: true

class Node
  attr_reader :data, :children
  attr_accessor :term

  def initialize(data)
    @data = data
    @children = []
    @term = false
  end

  def insert(char)
    return get(char) if have?(char)

    child = Node.new(char)
    @children << child
    child
  end

  def have?(char)
    @children.each do |c|
      return true if c.data == char
    end

    false
  end

  def get(char)
    @children.each do |child|
      return child if child.data == char
    end

    false
  end
end

class Trie
  attr_reader :root

  def initialize
    @root = Node.new(nil)
  end

  def insert(word)
    node = @root
    word.size.times do |i|
      child = node.insert(word[i])
      node = child
    end
    node.term = true
  end

  def have?(word)
    node = @root
    word.size.times do |i|
      return false unless node.have?(word[i])

      node = node.get(word[i])
    end

    node.term == true
  end
end

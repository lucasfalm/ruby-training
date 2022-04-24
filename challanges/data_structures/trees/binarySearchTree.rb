# frozen_string_literal: true

class BinarySearchTree
  @root = Node.new

  # Big O(log n)
  def find(key)
    value = @root.find(key)
    if value.nil?
    end
    value
  end

  # Big O(log n)
  def insert(key, value)
    node = Node.new
    node.key = key
    node.value = value

    if @root.nil?
      @root = node
      return @root
    end

    @root.insert(node)
  end

  # Big O(log n)
  def min
    min = @root.min
    min.value
  end

  # Big O(log n)
  def delete(key)
    response = @root.delete(key)
    return 'Error' unless response

    'Success!'
  end

  def inOrderTraversal
    current = @root
    current.inOrderTraversal
  end
end

class Node
  attr_accessor :key, :value, :left, :right

  def initialize(key = nil, value = nil, left = nil, right = nil)
    @key = key
    @value = value
    @left = left
    @right = right
  end

  # Big O(1)
  def min
    return 'Empty tree' if nil?

    if left.nil?
      self
    else
      left.min
    end
  end

  # Big O(log n)
  def inOrderTraversal
    unless value.nil?
      left&.inOrderTraversal
      puts left.key unless left.nil?
      right&.inOrderTraversal
    end
  end

  # Big O(log n)
  def delete(key)
    return false if self.key.nil?

    if key < self.key
      return left.delete(key) unless left.nil?

      return false
    elsif key > self.key
      return right.delete(key) unless right.nil?

      return false
    elsif key == self.key
      if right.nil? && left.nil?
        self.value = nil
        self.key = nil
      elsif !right.nil? && left.nil?
        self.value = right.value
        self.key = right.key
        self.right = nil
      elsif right.nil? && !left.nil?
        self.value = left.value
        self.key = left.key
        self.left = nil
      else
        min = right.min
        self.value = min.value
        self.key = min.key

        self.right = delete(right, self.key)
      end
      return true
    end

    false
  end

  # Big O(n log)
  def find(key)
    if nil?
      self
    elsif key == self.key
      value
    elsif key < self.key
      left.find(key)
    elsif key > self.key
      right.find(key)
    end
  end

  # Big O(n log)
  def insert(node)
    return 'Key already exists' if node.key == key

    if value.nil?
      self.value = node.value
      self.key = node.key
      return value
    end

    if node.key < key
      if left.nil?
        self.left = node
        return node.value
      end

      left.insert(node)

    elsif node.key > key
      if right.nil?
        self.right = node
        return node.value
      end

      right.insert(node)
    else
      value
    end
  end
end

bst = BinarySearchTree.new
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a.shuffle!.each do |v|
  bst.insert(v, v)
end

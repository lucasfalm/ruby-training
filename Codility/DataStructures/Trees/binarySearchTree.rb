class BinarySearchTree
    @root = Node.new

    # Big O(log n)
    def find(key)
        node = Node.find(@root, key)
        if node == nil 
            return node
        else
            return node.value
        end
    end

    def insert(key, value)
        node = Node.new()
        node.key = key
        node.value = value
    
        if @root == nil 
            @root = node
            return @root
        end
    
        Node.insert(node, @root)
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
        if left == nil 
            return left
        else
            return left.min
        end
    end

    # Big O(n log)
    def self.find(node, key)
        if node == nil 
            return node
        elsif key == node.key
            return node
        elsif key < node.key
            return find(node.left, key)
        elsif key > node.key 
            return find(node.right, key)
        end
    end

    # Big O(n log)
    def self.insert(node, root)
        return "Key already exists" if node.key == root.key
    
        if node.key < root.key
            if root.left == nil
                root.left = node
                return node.value
            end
        
            return insert(key, root.left)
    
        elsif node.key > root.key
            if root.right == nil 
                root.right = node
                return node.value
            end
        
            return insert(key, root.right)
        end
    end
end

bst = BinarySearchTree.new
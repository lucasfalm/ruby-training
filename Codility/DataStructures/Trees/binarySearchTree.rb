class BinarySearchTree
    @root = Node.new

    # Big O(log n)
    def find(key)
        node = @root.find(key)
        if node == nil 
            return node
        else
            return node.value
        end
    end

    # Big O(log n)
    def insert(key, value)
        node = Node.new()
        node.key = key
        node.value = value
    
        if @root == nil 
            @root = node
            return @root
        end
    
       @root.insert(node)
    end

    def min
        min = Node.min(@root)
        return min
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
    def min(root)
        return "Empty tree" if root == nil

        if root.left == nil
            return root.value
        else
            return root.left.min
        end
    end

    # Big O(n log)
    def find(key)
        if self == nil 
            return root
        elsif key == self.key
            return root
        elsif key < self.key
            return self.left.find(key)
        elsif key > self.key 
            return self.right.find(key)
        end
    end

    # Big O(n log)
    def insert(node, root)
        return "Key already exists" if node.key == root.key
    
        if node.value < root.value
            if root.left == nil
                root.left = node
                return node.value
            end
        
            return insert(node, root.left)
    
        elsif node.value > root.value
            if root.right == nil
                root.right = node
                return node.value
            end
        
            return insert(node, root.right)
        end
    end
end

bst = BinarySearchTree.new
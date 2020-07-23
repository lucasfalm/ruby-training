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
        min = @root.min
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
    def min
        return "Empty tree" if self == nil

        if self.left == nil
            return self.value
        else
            return self.left.min
        end
    end

    # Big O(n log)
    def find(key)
        if self == nil 
            return self
        elsif key == self.key
            return self.value
        elsif key < self.key
            return self.left.find(key)
        elsif key > self.key 
            return self.right.find(key)
        end
    end

    # Big O(n log)
    def insert(node)
        return "Key already exists" if node.key == self.key
    
        if node.value < self.value
            if self.left == nil
                self.left = node
                return node.value
            end
        
            return self.left.insert(node)
    
        elsif node.value > self.value
            if self.right == nil
                self.right = node
                return node.value
            end
        
            return self.rigth.insert(node)
        end
    end
end

bst = BinarySearchTree.new
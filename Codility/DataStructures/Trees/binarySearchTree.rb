class BinarySearchTree
    @root = Node.new

    # Big O(log n)
    def find(key)
        value = @root.find(key)
        if value == nil 
            return value
        else
            return value
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

    # Big O(log n)
    def min
        min = @root.min
        return min.value
    end


    def delete(key)
        response = @root.delete(key)
        return "Error" if !response
        return "Success!"
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
            return self
        else
            return self.left.min
        end
    end

    # Big O(log n)
    def delete(key)
        return false if self.key == nil
    
        if key < self.key
            return self.left.delete(key) if self.left != nil
            return false
        elsif key > self.key
            return self.right.delete(key) if self.right != nil
            return false
        elsif key == self.key
            if self.right == nil && self.left == nil
                self.value = nil
                self.key = nil
                return true
            elsif self.right != nil && self.left == nil 
                self.value = self.right.value
                self.key = self.right.key
                self.right = nil
                return true
            elsif self.right == nil && self.left != nil
                self.value = self.left.value
                self.key = self.left.key
                self.left = nil
                return true
            else
                min = self.right.min
                self.value = min.value
                self.key = min.key
                min = nil
                return true
            end
        end
        
        return false
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
        
        if self.value == nil
            self.value = node.value
            self.key = node.key
            return self.value
        end
        
        if node.key < self.key
            if self.left == nil
                self.left = node
                return node.value
            end
        
            return self.left.insert(node)
    
        elsif node.key > self.key
            if self.right == nil
                self.right = node
                return node.value
            end
        
            return self.right.insert(node)
        else
            return self.value
        end
    end
end


bst = BinarySearchTree.new
class Stack
    attr_accessor :head, :size

    def initialize(value = "")
        @head = Node.new(value)
        @size = 0
    end

    # Big O(1)
    def push(data)
        incrementSize()
        
        actualNode = @head
        newNode = Node.new(data)

        if actualNode == ""  || actualNode.value == ""
            @head = newNode
        else
            newNode.nextNode = actualNode
            @head = newNode
        end
        return @head.value
    end

    # Big O(1)
    def pop
        decrementSize()
        currentNode = @head
        return "Empty linked list" if currentNode == ""

        @head = currentNode.nextNode
        return currentNode.value
    end

    # Big O(1)
    def peek
        currentNode = @head
        return "Empty linked list" if currentNode == ""
        return currentNode.value
    end

    # Big O(1)
    def clear
        newNode = Node.new()
        
        @head = newNode
        @size = 0
        
        return @head
    end

    # Big O(1)
    def size
        return @size
    end

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
  
    def initialize(value = "", next_node = "")
        @value = value
        @nextNode = next_node
    end
end

stack = Stack.new

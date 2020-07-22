class Queue
    attr_accessor :head, :size

    def initialize(value = "")
        @head = Node.new(value)
        @tail = Node.new(value)
        @size = 0
    end

    # Big O(1)
    def enqueue(data)
        incrementSize()
        
        newNode = Node.new(data)

        if @tail != "" || @tail.value != ""
            @tail.nextNode = newNode
        end
        
        @tail = newNode

        if @head == ""  || @head.value == ""
            @head = @tail
        end
            
        return @tail.value
    end

    # Big O(1)
    def dequeue
        return "Empty Queue" if @size == 0
        
        currentNode = @head
        decrementSize()

        if @head == @tail
            @head = Node.new("")
            @tail = @head
            return currentNode.value
        end

        @head = currentNode.nextNode
        return currentNode.value
    end

    # Big O(1)
    def peek
        currentNode = @head
        return "Empty Queue" if currentNode == ""
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

q = Queue.new

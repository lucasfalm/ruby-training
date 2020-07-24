def Graph 
    @V = 0
    @adj = Array.new(0)

    def initialize(v, adj)
        @V = value
        adj = Node.new(v)
        while i <= v 
            adj[i] = Node.new()
            i += 1
        end
    end

    def addEdge(v, w) 
        @adj[v] << w
    end

    def BreadthFirstSearch(s)
        visited = Arra.new(false)

        queue = Queue.new()

        visited[s] = true
        puts "Starting at: #{s}"
    end
end






class Queue
    attr_accessor :head, :size

    def initialize(value = "")
        @head = Node.new(value)
        @tail = Node.new(value)
        @size = 0
    end
    # Out << [2, 1] << new value
    # Big O(1)
    def enqueue(data)
        newNode = Node.new(data)
        
        if @size >= 1
            @tail.nextNode = newNode
        end
        
        @tail = newNode
        
        if @size == 0
            @head = @tail
        end
        
        incrementSize()
        return @tail.value
    end

    # Big O(1)
    def dequeue
        return "Empty Queue" if @size == 0
        
        currentNode = @head
        
        if @size == 1
            @head = Node.new("")
            @tail = @head
        else
            @head = currentNode.nextNode
        end
        
        decrementSize()
        return currentNode.value
    end

    # Big O(1)
    def peek
        return "Empty Queue" if @size == 0
    
        currentNode = @head
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

class LinkedList
    attr_accessor :head, :size

    def initialize(value = "")
        @head = Node.new(value)
        @size = 0
    end

    # Big O(1)
    def addFront(data)
        incrementSize()
        
        actualNode = @head
        newNode = Node.new(data)

        if actualNode.value == ""
            @head = newNode
        else
            newNode.nextNode = actualNode
            @head = newNode
        end
        return @head.value
    end

    # Big O(n)
    def deleteLast
        return "Empty linkedset" if @size == 0

        counter = 0
        currentNode = @head
        
        while counter < @size
            if @size - counter == 1
                decrementSize()
                
                currentNode.nextNode = ""
        
                if @size == 0 
                    currentNode.value = ""
                end
        
                return true
            else
                counter += 1
                currentNode = currentNode.nextNode
            end
        end
    end

      # Big O(n)
      def deleteIn(pos)
        return "Not Found" if @size == 0 || pos > @size

        counter = 0
        currentNode = @head
    
        while counter < pos
            if pos - counter == 1
                decrementSize()
                
                currentNode.nextNode = currentNode.nextNode.nextNode
        
                if @size == 0 
                    currentNode.value = ""
                end
        
                return true
            else
                counter += 1
                currentNode = currentNode.nextNode
            end
        end
    end

    # Big O(1)
    def getFirst
        currentNode = @head
        return "Empty linked list" if currentNode.value == ""
        return currentNode.value
    end

    # Big O(n)
    def getLast
        currentNode = @head
        counter = 0
    
        return currentNode.value if @size == 1
    
        while counter <= @size
            counter += 1
 
            return currentNode.value if currentNode.nextNode == ""           
            currentNode = currentNode.nextNode
        end
    end

    # Big O(1)
    def clear
        newNode = Node.new()
        
        @head = newNode
        @size = 0
        
        return @head
    end

    # Big O(n) or Big (n log n)
    def addBack(value)
        currentNode = @head
        counter = 0
        newNode = Node.new(value)

        if currentNode.nextNode == "" 
            currentNode.nextNode = newNode
            return newNode.value
        end
    
        while counter <= @size
            counter += 1

            if currentNode.nextNode == "" 
                currentNode.nextNode = newNode
                return currentNode.nextNode.value
            end
            currentNode = currentNode.nextNode
        end

        incrementSize()
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

l = LinkedList.new
l.addFront(2)
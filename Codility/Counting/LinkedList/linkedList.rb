class LinkedList
    attr_accessor :head, :size

    def initialize(value = "")
        @head = Node.new(value)
        @size = 0
    end

    def addFront(data)
        @size += 1
        
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

    def getFirst
        currentNode = @head
        return "Empty linked list" if currentNode.value == ""
        return currentNode.value
    end

    def getLast
        currentNode = @head
        lastNode = ""
        counter = 0
            
        if currentNode.nextNode == "" 
            lastNode = currentNode
            return lastNode.value
        end
    
        while counter <= @size
            counter += 1
            if currentNode.nextNode == "" 
                return currentNode.value
            end

            currentNode = currentNode.nextNode
        end
    end

    def insertLast(value)
        currentNode = @head
        counter = 0
        newNode = Node.new(value)

        if currentNode.nextNode == "" 
            currentNode.nextNode = newNode
            return newNode.value
        end
    
        while counter <= @size
            counter += 1
            
            puts currentNode
            if currentNode.nextNode == "" 
                currentNode.nextNode = newNode
                return currentNode.nextNode.value
            end
        end
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
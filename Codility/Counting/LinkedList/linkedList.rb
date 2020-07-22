class LinkedList
    def initialize(value = "")
        @head = Node.new(value)
    end

    def addFront(data)
        currentNode = @head

        newNode = Node.new(data)
    
        if currentNode.value == ""
            @head = newNode
            return @head
        end

        @head.nextNode = newNode if @head.value != ""
        @head = newNode
        return newNode
    end

    def getFirst
        currentNode = @head
        return "Empty linked list" if currentNode.value == ""
        return currentNode
    end
end

class Node
    attr_accessor :value, :next
  
    def initialize(value, next_node = "")
        @value = value
        @nextNode = next_node
    end
end

l = LinkedList.new
l.addFront(2)
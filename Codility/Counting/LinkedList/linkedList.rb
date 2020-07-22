class LinkedList
    private 
    @head = ""

    class Node
        def initialize(data)
            @data = data
        end
        
        @nextNode = ""

        def setNext(node)
            @nextNode = node
        end
    end

    public

    def addFront(data)        
        newNode = Node.new(data)
        
        if @head == ""
            @head = newNode
            return
        end

        @head.setNext(newNode)
        @head = newNode
    end
end

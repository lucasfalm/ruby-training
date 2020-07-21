class MyArray
    def initialize(size)
        @size = size
        setBackingArray()
    end

    def showSize
        @selfArray.size
    end
    def getAtIndex(index)
        @selfArray[index] # O(1)
    end

    def showAll
        @selfArray # O(1)
    end

    def setValueAtIndex(index, value)
        @selfArray[index] = value # O(1)
    end

    def resize()
        clone = @selfArray.clone() # O(n)
        newArray = Array.new(@selfArray.size * 2 - clone.size) # O(1)

        newArray.unshift(clone) # O(n)
        newArray.flatten! # O(n)
    
        @selfArray = newArray # O(1)
        @selfArray
    end

    def insertAll(value)
        @selfArray = @selfArray.map { |v| v = value } # O(n)
    end

    def insertAtIndex(index, value)
        @selfArray.insert(index, value) # O(n)
    end

    def insertAtEnd(value)
        @selfArray << value # O(1)
    end

    def insertAtFirst(value)
        @selfArray.unshift(value) # O(1)
    end

    def deleteAtIndex(index)
        @selfArray.delete(index) # O(n)
    end

    private 

    def setBackingArray
        @selfArray = Array.new(@size) # O(1)
    end
end

myArray = MyArray.new(5)
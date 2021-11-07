class HashTable
    def initialize(arraySize = 16)
        @INITIAL_SIZE = arraySize
        @data = Array.new
    end

    # Big O(1) or O(N)
    def put(key, value)
        index = getIndex(key)

        entry = HashEntry.new(key, value)

        if @data[index] == nil 
            @data[index] = entry
        else 
            entries = @data[index]

            while entries.nextEntry != nil
                entries = entries.nextEntry
            end
            
            entries.nextEntry = entry
        end
    end

    # Big O(1) or O(N)
    def get(key)
        index = getIndex(key)
        entries = @data[index]
        
        if entries != nil

            # avoid collisions with linked list
            while entries.key != key && entries.nextEntry != nil
                entries = entries.nextEntry
            end

            return entries.value
        end

        return nil
    end

    private 

    # Big O(1)
    def getIndex(key)
        index = key.to_s.chars.inject(0) { |sum, ch| sum + ch.ord } % @INITIAL_SIZE
        return index
    end
end

class HashEntry
    attr_accessor :key, :value, :nextEntry
    
    def initialize(key, value, nextEntry = nil) 
        @key = key
        @value = value
        @nextEntry = nextEntry
    end
end

h = HashTable.new
# frozen_string_literal: true

class HashTable
  def initialize(arraySize = 16)
    @INITIAL_SIZE = arraySize
    @data = []
  end

  # Big O(1) or O(N)
  def put(key, value)
    index = getIndex(key)

    entry = HashEntry.new(key, value)

    if @data[index].nil?
      @data[index] = entry
    else
      entries = @data[index]

      entries = entries.nextEntry until entries.nextEntry.nil?

      entries.nextEntry = entry
    end
  end

  # Big O(1) or O(N)
  def get(key)
    index = getIndex(key)
    entries = @data[index]

    unless entries.nil?

      # avoid collisions with linked list
      entries = entries.nextEntry while entries.key != key && !entries.nextEntry.nil?

      return entries.value
    end

    nil
  end

  private

  # Big O(1)
  def getIndex(key)
    key.to_s.chars.inject(0) { |sum, ch| sum + ch.ord } % @INITIAL_SIZE
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

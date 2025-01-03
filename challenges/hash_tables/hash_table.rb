# frozen_string_literal: true

class HashTable
  def initialize(array_size = 16)
    @initial_size = array_size
    @data         = []
  end

  # Big O(1) or O(N)
  def put(key, value)
    index = get_index(key)

    entry = HashEntry.new(key, value)

    if @data[index].nil?
      @data[index] = entry
    else
      entries = @data[index]

      entries = entries.next_entry until entries.next_entry.nil?

      entries.next_entry = entry
    end
  end

  # Big O(1) or O(N)
  def get(key)
    index = get_index(key)
    entries = @data[index]

    unless entries.nil?

      # avoid collisions with linked list
      entries = entries.next_entry while entries.key != key && !entries.next_entry.nil?

      return entries.value
    end

    nil
  end

  private

  # Big O(1)
def get_index(key)
  key.to_s.chars.inject(0) { |sum, ch| sum + ch.ord } % @initial_size
end

class HashEntry
  attr_accessor :key, :value, :next_entry

  def initialize(key, value, next_entry = nil)
    @key        = key
    @value      = value
    @next_entry = next_entry
  end
end

h = HashTable.new

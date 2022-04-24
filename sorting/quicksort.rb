# frozen_string_literal: true

class QuickSort
  def sort(array)
    quickSort(array, 0, array.length - 1)

    array
  end

  def quickSort(_array, left, right)
    return if left >= right

    pivot = arra[(left + right) / 2]
  end
end

class Node
end

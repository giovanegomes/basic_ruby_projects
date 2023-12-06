# Build a method #bubble_sort that takes an array and returns a sorted array. It must use the bubble sort methodology
# (using #sort would be pretty pointless, wouldn’t it?).

def bubble_sort(array, count = 1)
  index = 0
  iterations = array.length - count
  sorted = true

  while index < iterations do
    next_index = index + 1
    if array[index] > array[next_index]
      aux = array[index]
      array[index] = array[next_index]
      array[next_index] = aux
      sorted = false
    end
    index += 1
  end

  bubble_sort(array, count += 1) if !sorted

  array
end

sorted_array = bubble_sort([4,3,78,2,0,2])
p sorted_array

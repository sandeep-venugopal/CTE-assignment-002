require 'merge_sort'

# Open the Array class to add an alternate sort method
class Array
  extend MergeSort
  def sort_arr
    array = dup # copy the existing array into new array
    MergeSort.sort(array)
  end

  def my_map
    return each unless block_given?
    new_array = []
    each_with_index do |element, index|
      new_array[index] = yield(element)
    end
    new_array
  end
end

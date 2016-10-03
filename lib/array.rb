require 'merge_sort'

# Open the Array class to add an alternate sort method
class Array
  extend MergeSort
  def sort_arr
    array = dup # copy the existing array into new array
    MergeSort.sort(array)
  end
end

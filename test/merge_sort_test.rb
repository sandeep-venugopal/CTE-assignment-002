require 'test_helper'
require 'merge_sort'

class MergeSortTest < Minitest::Test
  def test_that_it_has_a_sort_method_whose_return_type_is_array
    assert_kind_of Array, MergeSort.sort([1,2])
  end

  def test_that_the_sort_method_sorts_the_given_array_in_natural_order
    given_array = [7, 2, 3, 4]
    sorted_array = [2, 3, 4, 7]
    assert_equal sorted_array, MergeSort.sort(given_array)
  end

  def test_that_the_sort_method_sorts_the_given_array_of_letters_in_natural_order
    given_array = %w(b c d a)
    sorted_array = %w(a b c d)
    assert_equal sorted_array, MergeSort.sort(given_array)
  end

end

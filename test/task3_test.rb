require 'test_helper'
require 'array.rb'

class Task3Test < Minitest::Test
  def test_that_it_has_an_alternate_method_for_sorting
    array = []
    assert_respond_to array, :sort_arr
  end

  def test_that_sort_method_gives_sorted_array_of_numbers
    array = [7, 2, 3, 4]
    sorted_array = array.sort_arr
    assert_equal [2, 3, 4, 7], sorted_array
    assert !sorted_array.equal?(array)
  end

  def test_that_sort_method_gives_sorted_array_of_alphabets
    array = %w(b c d a)
    sorted_array = array.sort_arr
    assert_equal %w(a b c d), sorted_array
    assert !sorted_array.equal?(array)
  end
end

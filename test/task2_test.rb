require 'test_helper'
require 'array.rb'

class Task2Test < Minitest::Test
  def test_that_it_has_an_alternate_method_for_map
    array = []
    assert_respond_to array, :my_map
  end

  def test_that_my_map_returns_a_new_array_containing_values_returned_by_the_block
    array = [1, 2, 3, 4]
    result = array.my_map do |item|
      item * 2
    end
    assert_equal [2, 4, 6, 8], result
  end

  def test_that_my_map_returns_an_enumerator_if_no_block_is_passed
    array = [1, 2, 3, 4]
    assert_kind_of Enumerator, array.my_map
    assert_respond_to array.my_map, :with_index
  end

  def test_that_my_map_returns_a_new_array_containing_values_returned_by_proc
    array = [1, 2, 3, 4]
    result = array.my_map(&:to_s)
    assert_equal %w(1 2 3 4), result
  end
end

module MergeSort
  def self.sort(array)
    return array unless array.instance_of?(Array)
    return array if array.size < 2
    left = build_left_array(array)
    right = build_right_array(array)
    left = sort(left)
    right = sort(right)
    merge(left, right, array)
  end

  def self.build_left_array(array)
    length = array.size
    mid = length / 2
    left = Array.new(mid)
    (0..mid - 1).each do |i|
      left[i] = array[i]
    end
    left
  end

  def self.build_right_array(array)
    length = array.size
    mid = length / 2
    right = Array.new(length - mid)
    (mid..length - 1).each do |i|
      right[i - mid] = array[i]
    end
    right
  end

  def self.merge(left, right, array)
    l_size = left.size
    r_size = right.size
    i = 0
    j = 0
    k = 0
    while i < l_size && j < r_size
      if left[i] <= right[j]
        array[k] = left[i]
        i += 1
      else
        array[k] = right[j]
        j += 1
      end
      k += 1
    end
    while i < l_size
      array[k] = left[i]
      k += 1
      i += 1
    end
    while j < r_size
      array[k] = right[j]
      k += 1
      j += 1
    end
    array
  end

  class << self
    private :build_left_array
    private :build_right_array
    private :merge
  end
end

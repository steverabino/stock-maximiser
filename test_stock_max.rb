require 'minitest/autorun'
require_relative 'stock-max'

class TestCrateLocator < Minitest::Test
  def test_regular_example
    ary = [1, -1, 2, 7, 19, -1, -9, 0, 3]
    output = find_max_gain(ary)

    assert_equal 20, output[:max_gain]
    assert_equal 1, output[:low_index]
    assert_equal 4, output[:high_index]
  end

  def test_downward_slope
    ary = [8, 7, 6, 5, 4, 3, 2, 2, 1]
    output = find_max_gain(ary)

    assert_equal 0, output[:max_gain]
    assert_nil output[:low_index]
    assert_nil output[:high_index]
  end

  def test_upward_slope
    ary = [1, 2, 3, 4, 5, 6, 7, 8]
    output = find_max_gain(ary)

    assert_equal 7, output[:max_gain]
    assert_equal 0, output[:low_index]
    assert_equal 7, output[:high_index]
  end

  def test_u_shaped_curve
    ary = [8, 6, 4, 3, 1, 2, 5, 7]
    output = find_max_gain(ary)

    assert_equal 6, output[:max_gain]
    assert_equal 4, output[:low_index]
    assert_equal 7, output[:high_index]
  end

  def test_n_shaped_curve
    ary = [1, 3, 4, 6, 9, 8, 3, -4]
    output = find_max_gain(ary)

    assert_equal 8, output[:max_gain]
    assert_equal 0, output[:low_index]
    assert_equal 4, output[:high_index]
  end

  def test_tiny_gain_at_end_of_u_shaped_curve
    ary = [8, 6, 3, 2, 3]
    output = find_max_gain(ary)

    assert_equal 1, output[:max_gain]
    assert_equal 3, output[:low_index]
    assert_equal 4, output[:high_index]
  end

  def test_fluctuations_between_low_and_high
    ary = [-3, 2, -1, 4, 0, 3, 9, 8]
    output = find_max_gain(ary)

    assert_equal 12, output[:max_gain]
    assert_equal 0, output[:low_index]
    assert_equal 6, output[:high_index]
  end

  def test_fluctuations_between_high_and_low
    ary = [8, 2, -1, 2, 3, 0, 3, -5, -7]
    output = find_max_gain(ary)

    assert_equal 4, output[:max_gain]
    assert_equal 2, output[:low_index]
    assert_equal 4, output[:high_index]
  end


  def test_big_gain_as_second_big_gain
    ary = [1, 10, 3, -20, -10]
    output = find_max_gain(ary)

    assert_equal 10, output[:max_gain]
    assert_equal 3, output[:low_index]
    assert_equal 4, output[:high_index]
  end

  def test_big_gain_as_first_big_gain
    ary = [0, 19, 3, -22, -4]
    output = find_max_gain(ary)

    assert_equal 19, output[:max_gain]
    assert_equal 0, output[:low_index]
    assert_equal 1, output[:high_index]
  end
end
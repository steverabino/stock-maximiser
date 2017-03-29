def find_max_gain(ary)
  high, low = { price: ary[0], index: 0 }, { price: ary[0], index: 0 }
  gain = { max_gain: 0, low_index: nil, high_index: nil }

  ary.each_with_index do |price, index|
    unless index == 0
      # set highest if price > existing highest
      if price > high[:price]
        high = { price: price, index: index }
      end

      # set lowest if price < existing lowest
      # reset highest due to time constraint; highest must be after lowest)
      if price < low[:price]
        low = { price: price, index: index }
        high = { price: price, index: index }
      end

      # Check whether current gain is bigger than existing max gain
      if (high[:price] - low[:price]) > gain[:max_gain]
        gain[:max_gain] = high[:price] - low[:price]
        gain[:high_index] = high[:index]
        gain[:low_index] = low[:index]
      end
    end
  end
  puts gain
end

puts find_max_gain([1, -1, 2, 7, 19, -1, -9, 0, 3]) # 20 (1 -> 4)
puts find_max_gain([8, 7, 6, 5, 4, 3, 2, 2, 1]) # 0 (0 -> 0)
puts find_max_gain([1, 2, 3, 4, 5, 6, 7, 8]) # 7 (0 -> 7)
puts find_max_gain([8, 6, 4, 3, 1, 2, 5, 7]) # 6 (4 -> 7)
puts find_max_gain([1, 3, 4, 6, 9, 8, 3, -4]) # 8 (0 -> 4)
puts find_max_gain([0, 2, 1, 2, 1, 2, 1, -1]) # 2 (0 -> 1)
puts find_max_gain([8, 6, 3, 2, 3]) # 1 (3 -> 4)
puts find_max_gain([1, 10, 3, -20, -10]) # 10 (3 -> 4)
puts find_max_gain([0, 19, 3, -22, -4]) # 19 (0 -> 1)

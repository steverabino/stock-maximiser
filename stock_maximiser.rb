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
  gain
end

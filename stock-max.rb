require 'byebug'

def find_max_gain(ary)
  ary.each.with_index do |price, index|
    if index == 0
      @high, @low = {price: price, index: 1}, {price: price, index: 1}
      @gain = {gain: 0, low_index: nil, high_index: nil}
    else
      # set highest if > existing highest
      @high = price > @high[:price] ? {price: price, index: index + 1} : @high

      # set lowest if < existing lowest
      # reset highest due to time constraint; highest must be after lowest)
      if price < @low[:price]
        @high = {price: price, index: index + 1}
        @low = {price: price, index: index + 1}
      end

      # Check whether gain is bigger than existing
      if (@high[:price] - @low[:price]) > @gain[:gain]
        @gain[:gain] = @high[:price] - @low[:price]
        @gain[:high_index] = @high[:index]
        @gain[:low_index] = @low[:index]
      end
    end
  end
  puts @gain
end

puts find_max_gain([1, -1, 2, 7, 19, -1, -9, 0, 3]) # 20 (2 -> 5)
puts find_max_gain([8, 7, 6, 5, 4, 3, 2, 2, 1]) # 0 (1 -> 1)
puts find_max_gain([1, 2, 3, 4, 5, 6, 7, 8]) # 7 (1 -> 8)
puts find_max_gain([8, 6, 4, 3, 1, 2, 5, 7]) # 6 (5 -> 8)
puts find_max_gain([1, 3, 4, 6, 9, 8, 3, -4]) # 8 (1 -> 5)
puts find_max_gain([0, 2, 1, 2, 1, 2, 1, -1]) # 2 (1 -> 2)
puts find_max_gain([8, 6, 3, 2, 3]) # 1 (4 -> 5)
puts find_max_gain([1, 10, 3, -20, -10]) # 10 (4 -> 5)
puts find_max_gain([0, 19, 3, -22, -4]) # 19 (1 -> 2)

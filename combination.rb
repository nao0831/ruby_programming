def combination(array, max_number, number = 0)
    if max_number == number
        [[]]
    else
        result = []
        array.each_with_index{|value, index|
            result += test2(array[(index+1)..(array.size)], max_number, number + 1).map{|v| v << value}
        }
        result
    end
end

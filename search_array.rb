def search_array(target_array, key_array)
    value = key_array[0]
    size = key_array.size
    indexes = search_value target_array, value
    indexes.each do |i|
        array = target_array[i..i+size-1]
        return [i..i+size-1] if array == key_array
    end
    false
end

def search_value(target_array, value)
    result = []
    target_array.each_with_index do |v, index|
        result << index if value == v
    end
    result
end

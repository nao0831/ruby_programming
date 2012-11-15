def is_prime?(number)
    odd_numbers(number / 2).each{|n| return false if number % n == 0}
    true
end

def odd_numbers(to)
    (1..to / 2).map{|n| n * 2 + 1}
end

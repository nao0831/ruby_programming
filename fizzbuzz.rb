def output_fizzbuzz(number)
    if number % 3 == 0 and number % 5 == 0
        p "FizzBuzz"
    elsif number % 3 == 0
        p "Fizz"
    elsif number % 5 == 0
        p "Buzz"
    else
        p number
    end
end
end_number = ARGV[0]
(1..end_number.to_i).each {|n| output_fizzbuzz n}

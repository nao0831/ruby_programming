def to_binary(number)
    test(number, 2)
end

def test(warareru, waru, result = "")
    if warareru == 1
        "1#{result}"
    else
        test(warareru / waru, waru, "#{(warareru % waru)}#{result}")
    end
end

class Test
  def test
    print "This is test";
  end
end

obj = Test.new

class Test
  def test
    print "This is not test";
  end
end

obj.test

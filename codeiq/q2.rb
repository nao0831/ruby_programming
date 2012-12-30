class YesNoPillow
  attr_accessor :switched

  def front
    "Yes"
  end

  def back
    if self.switched
      "No"
    else
      "Yes"
    end
  end

  def switch
    self.switched = true
  end
end

p = YesNoPillow.new
p p.front
p p.back
p.switch
p p.front
p p.back

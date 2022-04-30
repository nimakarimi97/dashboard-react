class Year
  def self.leap?(year)
    (year % 4 == 0 and year % 100 != 0) or year % 400 == 0
  end
end

p Year.leap?(2100)
p Year.leap?(1600)
p Year.leap?(1996)
p Year.leap?(1997)

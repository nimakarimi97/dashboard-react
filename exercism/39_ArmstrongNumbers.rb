class ArmstrongNumbers
  def self.include?(number)
    # my first solution without knowing the digits method
    # number_string = number.to_s
    # power = number_string.size
    # sum = 0.upto(power - 1).sum { |i| number_string[i].to_i**power }

    # second solution
    digits = number.digits
    digits.sum { |digit| digit**digits.size }
  end
end

p ArmstrongNumbers.include?(153)
p ArmstrongNumbers.include?(9474)
p ArmstrongNumbers.include?(9475)

class PhoneNumber
  def self.clean(number)
    number = number.gsub(/\D/, '').sub(/\A1/, '')

    if number.size != 10 or number[0] == '0' or number[0] == '1' or
         number[3] == '0' or number[3] == '1'
      return nil
    end
    number
  end
end

PhoneNumber.clean('(223) 456-7890')
PhoneNumber.clean('1223.456.7890')
PhoneNumber.clean('+1 (223) 456-7890')
PhoneNumber.clean('(023) 456-7890')
PhoneNumber.clean('1 (123) 456-7890')

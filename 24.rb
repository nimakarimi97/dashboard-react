class Luhn
  def self.valid?(num)
    return false if num.strip.length < 2
    return false if num.match?('[a-zA-Z]')

    p num = num.strip.delete(' ')
    array = []
    appendNow = false

    num.reverse.chars do |element|
      if appendNow == false
        appendNow = !appendNow
        array << element.to_i
        next
      end

      if element.to_i * 2 < 10
        array << element.to_i * 2
      else
        array << element.to_i * 2 - 9
      end
      appendNow = !appendNow
    end
    array.sum % 10 == 0
  end
end

p Luhn.valid?('4539 3195 0343 6467')
p Luhn.valid?('095 245 88')

p Luhn.valid?('055aa 444 285')

p Luhn.valid?(' 0')

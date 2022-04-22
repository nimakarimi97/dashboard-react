class SimpleCalculator
  ALLOWED_OPERATIONS = %w[+ / *].freeze

  def self.calculate(first_operand, second_operand, operation)
    unless ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation, 'Unsupported operation error'
    end

    if first_operand.nil? || second_operand.nil?
      raise ArgumentError.new('Please enter the inputs as a number.')
    end

    begin
      "#{first_operand} #{operation} #{second_operand} = #{eval "#{first_operand}#{operation}#{second_operand}"}"
      #* Also eval used to change the strings to numbers if the inputs were entered as strings
    rescue ZeroDivisionError
      return 'Division by zero is not allowed.'
    rescue ArgumentError => e
      raise
    end
  end

  class UnsupportedOperation < StandardError
  end
end

puts SimpleCalculator.calculate('16', 51, '+')
# # => "16 + 51 = 67"
puts SimpleCalculator.calculate(32, 6, '*')
# # => "32 * 6 = 192"
puts SimpleCalculator.calculate(512, 4, '/')
# => "512 / 4 = 128"
# puts SimpleCalculator.calculate(1, 2, '-')

# puts SimpleCalculator.calculate(33, 0, '')
puts SimpleCalculator.calculate(33, nil, '*')

class SimpleCalculator
  ALLOWED_OPERATIONS = %w[+ / *].freeze

  def self.calculate(first_operand, second_operand, operation)
    begin
      if first_operand.is_a? String or second_operand.is_a? String
        raise ArgumentError.new('invalid argument')
      end
      case operation
      when '+'
        "#{first_operand} + #{second_operand} = #{first_operand + second_operand}"
      when '*'
        "#{first_operand} * #{second_operand} = #{first_operand * second_operand}"
      when '/'
        "#{first_operand} / #{second_operand} = #{first_operand / second_operand}"
      else
        raise 'UnsupportedOperation'
      end
      # rescue StandardError
      #   raise ZeroDivisionError.new('Division by zero is not allowed.')
      #   raise e
    rescue ZeroDivisionError => e
      puts "Exception Message:#{e.message}"
      # rescue ZeroDivisionError => e
      #   puts 'Division by zero is not allowed.'
    rescue ArgumentError => e
      puts e.message
    end
  end
end

# puts SimpleCalculator.calculate('16', 51, '+')
# # => "16 + 51 = 67"
# puts SimpleCalculator.calculate(32, 6, '*')
# # => "32 * 6 = 192"
# puts SimpleCalculator.calculate(512, 4, '/')
# => "512 / 4 = 128"
# puts SimpleCalculator.calculate(1, 2, '-')
# => Raises an UnsupportedOperation

puts SimpleCalculator.calculate(33, 0, '/')
# => Raises an ArgumentError

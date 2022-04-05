class LogLineParser
  def initialize(line)
    # @line = line
    level, message = line.split(':')
    @message = message.strip!
    @level = level.gsub!(/\[|\]/, '').strip!.downcase
  end

  def message
    # indexOfColon = @line.index(':')
    # justMessage = @line.slice(indexOfColon + 1, @line.size).strip!
    # return justMessage
    return @message
  end

  def log_level
    # logLevel = @line.slice(@line.index('[') + 1..@line.index(']') - 1).downcase!
    # return logLevel
    return @level
  end

  def reformat
    # return "#{message} (#{log_level})"
    return "#{@message} (#{@level})"
  end
end

puts LogLineParser.new('    [ERROR]: Invalid operation      ').message
# => "Invalid operation"

puts LogLineParser.new("        [WARNING]:  Disk almost full\r\n").message
# => "Disk almost full"

puts LogLineParser.new('         [ERROR]: Invalid operation').log_level
# => "error"

puts LogLineParser.new('    [INFO]:         Operation completed').reformat
# => "Operation completed (info)"

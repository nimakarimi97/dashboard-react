class LogLineParser
  def initialize(line)
    level, message = line.split(':')
    @message = message.strip!
    @level = level.gsub!(/\[|\]/, '').strip!.downcase
  end

  def message
    @message
  end

  def log_level
    @level
  end

  def reformat
    "#{@message} (#{@level})"
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

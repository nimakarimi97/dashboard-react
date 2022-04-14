class TwoFer
  def self.two_fer(name = 'you')
    "One for #{name}, one for me." if name.is_a? String
  end
end

puts TwoFer.two_fer

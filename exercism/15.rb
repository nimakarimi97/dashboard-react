class Acronym
  def self.abbreviate(text)
    output = []
    textWords = text.upcase.split(' ')

    textWords.map do |word|
      if word.include? '-'
        word.split('-').map { |w| output << w[0] }
      else
        output << word[0]
      end
    end
    output.join

    # * from community
    # text.scan(/\w+/) { |w| p w[0].upcase }
    # p text.split(/\W/).map(&:chr).join.upcase
  end
end

text = 'Complementary metal-oxide semiconductor'
p Acronym.abbreviate(text)
p Acronym.abbreviate('Something - I made up from thin air')

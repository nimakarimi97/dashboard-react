class Phrase
  def initialize(string)
    @string = string.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    @string.each_with_object(Hash.new(0)) { |element, hash| hash[element] += 1 } # or I could use @string.count(element)

    #* second solution
    # @string.tally
  end
end

counting = Phrase.new("First: don't laugh. Then: don't cry.")
p counting.word_count
p Phrase.new("Joe can't tell between 'large' and large.").word_count

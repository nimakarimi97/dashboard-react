class Isogram
  def self.isogram?(string)
    rep = []
    string = string.downcase.gsub(/[^a-zA-Z]/, '')

    string.chars { |char| rep << char }
    rep = rep.sort

    isogram = true
    for i in 0...string.length - 1
      if rep[i] == rep[i + 1]
        isogram = !isogram
        break
      end
    end
    isogram ? 'it\'s isogram' : 'it\'s not isogram'
  end
end

input = 'Emily Jung Schwartzkopf'
p Isogram.isogram?(input)

input = 'el23- ev. - eee ---- en'
p Isogram.isogram?(input)

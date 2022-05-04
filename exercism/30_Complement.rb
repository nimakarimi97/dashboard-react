class Complement
  CHANGE = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }

  def self.of_dna(strand)
    strand.chars.map { |char| CHANGE[char] }.join

    #* from community
    # strand.tr('GCTA', 'CGAU')
  end
end

p Complement.of_dna('G') #C
p Complement.of_dna('TG') #AC
p Complement.of_dna('ACGTGGTCTTAA') # UGCACCAGAAUU

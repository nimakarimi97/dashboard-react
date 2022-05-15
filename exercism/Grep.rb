class Grep
  attr_reader :pattern, :flags, :files
  def initialize(pattern, flags, files)
    @pattern = pattern
    @flags = flags
    @files = files
  end

  def self.grep(pattern, flags, files)
    new(pattern, flags, files).grep
  end

  def grep
    files
      .each_with_object([]) do |file, output|
        IO
          .readlines(file)
          .each_with_index do |line, index|
            if match? (line)
              result = line.chop
              result = "#{index + 1}:" + result if print_line_number?
              result = "#{file}:" + result if files.size > 1
              result = "#{file}" if print_file_names?

              output << result
            end
          end
      end
      .uniq
      .join("\n")
  end

  def new_pattern
    match_entire_line? ? "^#{pattern}$" : pattern
  end

  def expression
    case_insensitive? ? /#{new_pattern}/i : /#{new_pattern}/
  end
  def match?(line)
    inverted_match? ? line !~ expression : line =~ expression
  end

  def match_entire_line?
    flags.include?('-x')
  end
  def print_line_number?
    flags.include?('-n')
  end
  def print_file_names?
    flags.include?('-l')
  end
  def inverted_match?
    flags.include?('-v')
  end
  def case_insensitive?
    flags.include?('-i')
  end
end

pattern = 'host'
flags = ['-n']
files = %w[iliad.txt midsummer-night.txt]
a = Grep.new(pattern, flags, files)
p a.grep

IO.write 'iliad.txt', <<~ILIAD
  Achilles sing, O Goddess! Peleus' son;
  His wrath pernicious, who ten thousand woes
  Caused to Achaia's host, sent many a soul
  Illustrious into Ades premature,
  And Heroes gave (so stood the will of Jove)
  To dogs and to all ravening fowls a prey,
  When fierce dispute had separated once
  The noble Chief Achilles from the son
  Of Atreus, Agamemnon, King of men.
  ILIAD
IO.write 'midsummer-night.txt', <<~MSNIGHT
  I do entreat your grace to pardon me.
  I know not by what power I am made bold,
  Nor how it may concern my modesty,
  In such a presence here to plead my thoughts;
  But I beseech your grace that I may know
  The worst that may befall me in this case,
  If I refuse to wed host Demetrius.
  MSNIGHT
IO.write 'paradise-lost.txt', <<~PARADISE
  Of Mans First Disobedience, and the Fruit
  Of that Forbidden Tree, whose mortal tast
  Brought Death into the World, and all our woe,
  With loss of Eden, till one greater Man
  Restore us, and regain the blissful Seat,
  Sing Heav'nly Muse, that on the secret top
  Of Oreb, or of Sinai, didst inspire
  That Shepherd, who first taught the chosen Seed
  PARADISE

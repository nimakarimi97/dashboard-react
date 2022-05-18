class Team
  attr_reader :table
  def table_of_points(input)
    @table = {}
    input
      .split("\n")
      .each do |match|
        firstOponent, secondOponent, result = match.split(';')

        table[firstOponent] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } if table[
          firstOponent
        ].nil?
        table[secondOponent] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } if table[
          secondOponent
        ].nil?

        table[firstOponent][:mp] += 1
        table[secondOponent][:mp] += 1

        if result == 'win'
          table[firstOponent][:w] += 1
          table[firstOponent][:p] += 3
          table[secondOponent][:l] += 1
        elsif result == 'loss'
          table[secondOponent][:w] += 1
          table[secondOponent][:p] += 3
          table[firstOponent][:l] += 1
        else
          table[firstOponent][:d] += 1
          table[secondOponent][:d] += 1
          table[firstOponent][:p] += 1
          table[secondOponent][:p] += 1
        end
      end
    table
  end
end

class Tournament
  def self.tally(input)
    headers = %w[Team MP W D L P]
    str = format(headers)

    table = Team.new.table_of_points(input)
    p table
    table
      .sort_by { |name, numbers| p [-numbers[:p], name] }
      .each do |k, v|  #* - is for sorting descending
        row = [k, v[:mp], v[:w], v[:d], v[:l], v[:p]]
        str << format(row)
      end
    p str
  end

  def self.format(array)
    sprintf "%-30s | %2s | %2s | %2s | %2s | %2s\n", *array
  end
end

input = <<~INPUT
  Devastating Donkeys;Courageous Californians;draw
  Allegoric Alaskans;Blithering Badgers;win
  Devastating Donkeys;Allegoric Alaskans;win
  Courageous Californians;Blithering Badgers;loss
  Blithering Badgers;Devastating Donkeys;draw
  Allegoric Alaskans;Courageous Californians;win
  INPUT

Tournament.tally(input)

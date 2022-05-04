class Tournament
  def self.tally(input)
    competitors = { winners: [], losers: [], draw: [] }
    all = {}

    input
      .split("\n")
      .each do |match|
        firstOponent = match.split(';')[0]
        secondOponent = match.split(';')[1]
        result = match.split(';')[2]

        if !all.include?(firstOponent)
          #   all[firstOponent] = []
          #   all[secondOponent] = []
        end

        # puts "#{firstOponent}  #{secondOponent}   #{result}"
        if result == 'win'
          competitors[:winners] << firstOponent
          competitors[:losers] << secondOponent
        elsif result == 'loss'
          competitors[:losers] << firstOponent
          competitors[:winners] << secondOponent
        else
          competitors[:draw] << firstOponent
          competitors[:draw] << secondOponent
        end
      end

    p competitorsTally = competitors.values.map { |list| list.sort.tally }
    competitorsTally.each do |eachOne|
      eachOne.keys.each { |key| all[key] = eachOne[key] }
    end
    p all
    competitors.group_by { |element, value| }

    # all = {
    #     firstTeam: [10, 2 , 2 , 6, 12],

    # }

    # puts
    # p a.each { |team, n| puts team }
    # puts
    # p scores = competitors[:winners].tally
    # p scores = competitors[:draw].tally

    puts
    # !all.include?('Allegoric Alaskans')

    # if !all.include?('Allegoric Alaskans')
    # end

    #
    #
    #
    #
    #
    #     output = <<~TALLY
    #     Team                           | MP |  W |  D |  L |  P
    #     #{team}             #{results}
    #   TALLY
  end
end

# input = <<~INPUT
#       Blithering Badgers;Allegoric Alaskans;loss
#     INPUT
# Tournament.tally(input)

input = <<~INPUT
  Devastating Donkeys;Courageous Californians;draw
  Allegoric Alaskans;Blithering Badgers;win
  Devastating Donkeys;Allegoric Alaskans;win
  Courageous Californians;Blithering Badgers;loss
  Blithering Badgers;Devastating Donkeys;draw
  Allegoric Alaskans;Courageous Californians;win
  INPUT

Tournament.tally(input)

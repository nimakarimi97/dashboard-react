class TwelveDays
  def self.nth(n)
    numbers = %w[
      first
      second
      third
      fourth
      fifth
      sixth
      seventh
      eighth
      ninth
      tenth
      eleventh
      twelfth
    ]
    "On the #{numbers[n]} day of Christmas my true love gave to me: "
  end

  def self.song
    lyrics = [
      "a Partridge in a Pear Tree.\n",
      'two Turtle Doves, and ',
      'three French Hens, ',
      'four Calling Birds, ',
      'five Gold Rings, ',
      'six Geese-a-Laying, ',
      'seven Swans-a-Swimming, ',
      'eight Maids-a-Milking, ',
      'nine Ladies Dancing, ',
      'ten Lords-a-Leaping, ',
      'eleven Pipers Piping, ',
      'twelve Drummers Drumming, '
    ]

    output =
      (0...3)
        .map { |day| self.nth(day) + lyrics.slice(0..day).reverse.join }
        .join("\n")
  end
end

p TwelveDays.song

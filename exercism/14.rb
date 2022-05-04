class ResistorColorDuo
  Colors = {
    'black' => '0',
    'brown' => '1',
    'red' => '2',
    'orange' => '3',
    'yellow' => '4',
    'green' => '5',
    'blue' => '6',
    'violet' => '7',
    'grey' => '8',
    'white' => '9',
  }
  def self.value(array)
    array.take(2).map(&Colors).join.to_i
  end
end

puts ResistorColorDuo.value(%w[blue white red])

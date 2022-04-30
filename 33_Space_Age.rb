class SpaceAge
  attr_reader :seconds
  ORBITAL_PERIODS = {
    earth: 1,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132,
  }
  def initialize(seconds)
    @seconds = seconds
  end

  ORBITAL_PERIODS.each do |planet, period|
    define_method("on_#{planet}") do
      seconds / period / (60 * 60 * 24 * 365.25).to_f
    end
  end
end
p age = SpaceAge.new(2_134_835_688)
p age.on_earth
p age.on_mercury
p age.on_jupiter

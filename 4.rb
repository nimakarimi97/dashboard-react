class Attendee
  def initialize(height)
    @height = height
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end

  # Do not edit above methods, add your own methods below.

  # rubocop:disable Naming/PredicateName
  def has_pass?
    # hasPass = @pass_id != nil
    return @pass_id != nil
  end

  # rubocop:enable Naming/PredicateName

  def fits_ride?(ride_minimum_height)
    # fitToRide =  @height >= ride_minimum_heightz
    return @height >= ride_minimum_height
  end

  def allowed_to_ride?(ride_minimum_height)
    return @pass_id != nil && @height >= ride_minimum_height
  end
end

attendee = Attendee.new(106)

puts attendee.has_pass?
attendee.issue_pass!(42)
puts attendee.has_pass?

print 'fits ride    '
puts attendee.fits_ride?(100)
puts attendee.allowed_to_ride?(120)

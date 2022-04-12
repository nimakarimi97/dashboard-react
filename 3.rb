class Attendee
  def initialize(height)
    @height = height
    @pass_id = nil
  end

  def height
    @height
  end

  def pass_id
    @pass_id
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end
end

attendee = Attendee.new(106)

puts attendee.height
puts attendee.pass_id #nil
puts attendee.issue_pass!(42)
puts attendee.revoke_pass!
puts attendee.pass_id

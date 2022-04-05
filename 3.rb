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

# class Suitcase
#     def initialize
#       @locked = false
#     end

#     def locked? # Query methods should be named with a trailing `?`
#       @locked
#     end

#     def lock! # Methods which mutate state should have trailing `!`
#       @locked = true
#     end
#   end

#   suitcase = Suitcase.new
#   puts suitcase.locked? # false
#   suitcase.lock!
#   puts suitcase.locked? # true

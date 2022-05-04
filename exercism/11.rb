class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  attr_reader :age, :member
  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    age >= 60 ? 10 : 15
  end

  def watch_scary_movie?
    age >= 18 ? true : false
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    member == true ? '🍿' : raise(NotMovieClubMemberError)
  end
end

Moviegoer.new(21).watch_scary_movie?
#=> true

Moviegoer.new(17).watch_scary_movie?
#=> false

p Moviegoer.new(21, member: true).claim_free_popcorn!
#=> 🍿

p Moviegoer.new(17, member: false).claim_free_popcorn!
#=> Exception was raised! (NotMovieClubMemberError)

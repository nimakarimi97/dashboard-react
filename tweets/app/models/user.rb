class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true

  # format: {
  #   with: /\A[@\s]+@[@\s]+\z/,
  #   message: 'must be a valid email address',
  # }

  has_many :twitter_accounts
  has_many :tweets
  def new; end
end

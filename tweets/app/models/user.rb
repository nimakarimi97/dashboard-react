class User < ApplicationRecord
  has_secure_password
  validates :email,
            format: {
              with: /\A[@\s]+@[@\s]+\z/,
              message: 'must be a valid email address',
            }

  #   has_many :twitter_accounts
  def new; end
end

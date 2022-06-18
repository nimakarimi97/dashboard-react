class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true

  after_initialize { self.publish_at ||= 3.hours.from_now }

  def published?
    tweet_id?
  end
end

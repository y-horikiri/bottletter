class Letter < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 400}
  validates :repliable, inclusion: {in: [true, false]}
  validates :twitter_attached, inclusion: {in: [true, false]}
end

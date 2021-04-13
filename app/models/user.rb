class User < ApplicationRecord
  has_many :letter

  validates :name, presence: true
  validates :twitter_id, presence: true
end

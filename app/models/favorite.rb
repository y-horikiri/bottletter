class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :letter

  validates :user_id, presence: true
  validates :letter_id, presence: true

end

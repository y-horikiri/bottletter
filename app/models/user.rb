class User < ApplicationRecord
  has_many :letters, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :recieved_letters, class_name: "Letter", foreign_key: "reply_to"

  validates :name, presence: true
  validates :authenticated, inclusion: {in: [true, false]}
  
end

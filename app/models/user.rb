class User < ApplicationRecord
  has_many :letters, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :authenticated, inclusion: {in: [true, false]}
  
end

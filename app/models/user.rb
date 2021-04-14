class User < ApplicationRecord
  has_many :letter

  validates :name, presence: true
end

class Letter < ApplicationRecord
  belongs_to :user
  has_many :favorites
  belongs_to :recipient, class_name: "User", foreign_key: "reply_to", required: false

  default_scope -> { order(created_at: :desc)}
  
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 400}
  validates :repliable, inclusion: {in: [true, false]}
  validates :repliable, inclusion: {in: [false]}, if: -> {user && !user.authenticated?}
  validates :twitter_attached, inclusion: {in: [true, false]}
  validates :twitter_attached, inclusion: {in: [false]}, if: -> {user && user.twitter_id.nil?}


end

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :picture

  scope :by_newest, -> { self.order(created_at: :desc) }
  scope :of_followed_users, -> (following_users) { where user_id: following_users }
  validates :content, length: { minimum: 2 }
end

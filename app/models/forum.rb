class Forum < ApplicationRecord
  extend FriendlyId

  belongs_to :user

  scope :by_newest, -> { self.order(created_at: :desc) }

  friendly_id :question, use: :slugged
  # Validations
  validates :title, length: { minimum:5 }
  validates :question, length: { minimum:5 }
end

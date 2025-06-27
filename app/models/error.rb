class Error < ApplicationRecord
  validates :error, presence: true, length: { minimum: 3}
  validates :description, presence: true, length: { minimum: 10}

  has_many_attached :uploads

  scope :by_newest, -> { self.order(created_at: :desc) }
end

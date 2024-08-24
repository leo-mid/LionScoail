class Picturescene < ApplicationRecord
  validates :name, length: { minimum: 1}

  belongs_to :movie

  has_one_attached :picture
end

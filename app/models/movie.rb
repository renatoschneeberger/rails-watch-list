class Movie < ApplicationRecord
  has_many :bookmarks
  # A movie must have a unique title and an overview.
  validates :overview, :title, presence: true
  validates :title, uniqueness: true
end

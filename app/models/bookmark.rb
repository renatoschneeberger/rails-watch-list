class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
  validates :list_id, :movie_id, presence: true
  validates_uniqueness_of :movie_id, scope: :list_id
  # The comment of a bookmark cannot be shorter than 6 characters.
  validates :comment, length: { minimum: 6 }
end

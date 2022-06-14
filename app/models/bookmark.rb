class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  validates :list_id, uniqueness: { scope: :movie_id }
  # validates :movie, uniquesness: { scope: :list_id }
  # validates :list_id, uniqueness: { scope: :movie_id }
  # basically validating the two pairs inside the bookmark model
end

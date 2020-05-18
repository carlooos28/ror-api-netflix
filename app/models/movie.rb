class Movie < ApplicationRecord

  validates :title_movie, presence: true
  validates :movie_overview, presence: true
  validates :poster_path, presence: true
  validates :release_date, presence: true
  
end

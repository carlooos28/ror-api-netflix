class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title_movie, :movie_overview, :vote_count, :poster_path, :release_date
end

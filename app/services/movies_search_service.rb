class MoviesSearchService 
  def self.search(curr_movies, query)

    movies_ids = Rails.cache.fetch("movies_search/#{query}", expires_in: 1.hours) do 
      curr_movies.where("title_movie like '%#{query[:title_movie]}%' OR 
                         movie_overview = '%#{query[:movie_overview]}%' OR 
                         vote_count = '%#{query[:vote_count]}%' OR 
                         release_date = '%#{query[:release_date]}%' ").map(&:id)       
    end

    curr_movies.where(id: movies_ids)         

  end
end
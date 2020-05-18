module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: [:show, :update, :destroy]

      rescue_from Exception do |e| 
        render json: {error: e.message}, status: :iternal_error
      end

      rescue_from ActiveRecord::RecordNotFound do |e| 
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e| 
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index

        @movies = Movie.all

        if params[:movie].present? 
          @movies = MoviesSearchService.search(@movies, movie_params)
        end
        render json: @movies, status: :ok 
        
      end

      def create
        @movie = Movie.new(movie_params)

        if @movie.save
          render json: @movie, status: :created
        else
          render json: @movie.errors, status: :unprocessable_entity
        end
      end

      private
        def set_movie
          @movie = Movie.find(params[:id])
        end

        def movie_params
          params.require(:movie).permit(:title_movie, :movie_overview, :vote_count, :poster_path, :release_date)
        end
    end
  end
end

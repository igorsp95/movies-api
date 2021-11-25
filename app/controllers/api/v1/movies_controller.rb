module Api
  module V1
    class MoviesController < ApplicationController
      def index
        if params[:query].present?
          sql_query = "genre ILIKE :query OR release_year ILIKE :query OR country ILIKE :query"
          @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
          render json: { movie_filter: "#{params[:query]}", data: @movies}, status: :ok
        else
          @movies = Movie.order('release_year DESC')
          render json: { data: @movies}, status: :ok
        end
      end

      def import
        Movie.import(params[:file])
        render json: { status: 'SUCCESS', message: 'Movies successfully imported. Check it out on "/movies"' }, status: :ok
      end
    end
  end
end
class Api::V1::MoviesController < ApplicationController
  def index
    if params[:query].present?
      search_query = "genre @@ :query OR release_year @@ :query OR country @@ :query"
      @movies = Movie.where(search_query, query: "%#{params[:query]}%")
      render json: { search: "Movies seached by '#{params[:query]}'", data: @movies}, status: :ok
    else
      @movies = Movie.order('release_year')
      render json: {data: @movies}, status: :ok
    end
  end

  def import
    Movie.import_csv(params[:file])
  end
end


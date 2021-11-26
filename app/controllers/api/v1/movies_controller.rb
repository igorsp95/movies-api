class Api::V1::MoviesController < ApplicationController
  def index
    filter_message = "/api/v1/movies?country='country' | /api/v1/movies?release_year='release_year' | /api/v1/movies?genre='genre'"
    if params[:release_year].present?
      release_year_query = "release_year @@ :query OR country @@ :query"
      @movies = Movie.where(release_year_query, query: "%#{params[:release_year]}%")
      render json: {filter: filter_message, search: "Movies seached by '#{params[:release_year]}'", data: @movies}, status: :ok
    elsif params[:genre].present?
      genre_query = "genre @@ :query"
      @movies = Movie.where(genre_query, query: "%#{params[:genre]}%")
      render json: {filters: filter_message, search: "Movies seached by '#{params[:genre]}'", data: @movies}, status: :ok
    elsif params[:country].present?
      country_query = "country @@ :query"
      @movies = Movie.where(country_query, query: "%#{params[:country]}%")
      render json: {filters: filter_message, search: "Movies seached by '#{params[:country]}'", data: @movies}, status: :ok
    else
      @movies = Movie.order('release_year')
      render json: {filters: filter_message, data: @movies}, status: :ok
    end
  end

  def import
    Movie.import_csv(params[:file])
  end
end

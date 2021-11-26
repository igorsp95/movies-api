require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :request do
  before :each do
    @file = fixture_file_upload('fake_data.csv', 'csv')
    Movie.import_csv(@file)
  end

  it 'should return the correct number of movies' do
    get '/api/v1/movies'
    expect(JSON.parse(response.body)['data'].count).to eq(8)
  end

  it 'should return the first show_if movie' do
    get '/api/v1/movies'
    expect(JSON.parse(response.body)['data'].first['show_id']).to eq('s72')
  end

  it 'should return movies with correct genre' do
    get '/api/v1/movies?genre=tv+show'
    expect(JSON.parse(response.body)['data'].first['genre']).to eq('TV Show')
  end

  it 'should return movies with correct release_year' do
    get '/api/v1/movies?release_year=2006'
    expect(JSON.parse(response.body)['data'].first['release_year']).to eq('2006')
  end

  it 'should return movies with correct country' do
    get '/api/v1/movies?country=china'
    expect(JSON.parse(response.body)['data'].first['country']).to eq('Hong Kong, China, Singapore')
  end
end

require 'rails_helper'

RSpec.describe Movie, type: :model do
  before :each do
    @file = fixture_file_upload( 'fake_data.csv', 'csv')
  end

  describe 'import movies' do
    context 'when file is provided' do
      it 'import movies' do
        Movie.import_csv(@file)
        expect(Movie.find_by(title: '16 Blocks').director)
          .to eq "Richard Donner"
      end
    end
  end

  describe 'movies validation' do

    it 'title cant be nil' do
      movie = Movie.new(title: nil)
      expect(movie).not_to be_valid
    end

    it 'movie title should be unique' do
      Movie.import_csv(@file)
      movie = Movie.new(title: '16 Blocks')
      expect(movie).not_to be_valid
    end
  end
end


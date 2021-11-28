# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  before :each do
    @file = fixture_file_upload('fake_data.csv', 'csv')
  end

  describe 'import movies' do
    it 'import movies' do
      Movie.import_csv(@file)
      expect(Movie.find_by(title: '16 Blocks').director)
        .to eq 'Richard Donner'
    end
  end

  describe 'movies validation' do
    it 'show_id should be unique' do
      movie = Movie.new(show_id: 's72')
      expect(movie).not_to be_valid
    end

    it 'show_id cant be nil' do
      movie = Movie.new(show_id: nil)
      expect(movie).not_to be_valid
    end

    it 'title cant be nil' do
      movie = Movie.new(title: nil)
      expect(movie).not_to be_valid
    end
  end
end

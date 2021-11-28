# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :show_id, presence: true, uniqueness: true
  validates :title, presence: true

  def self.import_csv(file)
    CSV.foreach(file.path, 'r:bom|utf-8', headers: true, col_sep: ',', quote_char: '"') do |row|
      Movie.where(show_id: row[1]).create! row.to_hash
    end
  end
end

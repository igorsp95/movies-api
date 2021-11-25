class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  def self.import(file)
    CSV.foreach(file.path, 'r:bom|utf-8', headers: true, col_sep: ',', quote_char: '"') do |row|
       Movie.where(title: row[1]).create! row.to_hash
    end
  end
end

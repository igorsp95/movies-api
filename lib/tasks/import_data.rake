namespace :import do
  desc 'Import Movies Data from CSV'
  task :data, [:file] => :environment do |_t, args|
    puts 'rails import:data[file_path] required' && return unless args[:file]
    puts "Importing file #{args[:file]}"

    CSV.foreach(File.path(Rails.root.join('db', "#{args[:file]}.csv")), 'r:bom|utf-8', headers: true, col_sep: ',', quote_char: '"') do |row|
      Movie.where(show_id: row[1]).create! row.to_hash
    end
  end
end
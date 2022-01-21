# README
To run the project:

- Download the project.

- Run 'bundle install' on terminal.

- Run 'db:create' 'db:migrate'.

- Run the rails server.

- Click on 'choose file' end select the CSV file.

- Click on 'Import CSV' to import the file.

- Click on 'Check JSON file' to check the api with the new data imported.

You can check the application here: 'https://movies-api-igor-parente.herokuapp.com/'

Endpoints:

- '/': import CSV file (root)

- '/api/v1/movies': read JSON api

Filters:

- '/api/v1/movies?release_year=release_year' to filter by year |
  ex: /api/v1/movies?release_year=2020

- '/api/v1/movies?genre=genre' genre filter |
  ex: /api/v1/movies?genre=tv+show

- '/api/v1/movies?country=country' country filter |
  ex: /api/v1/movies?country=united+states

To test, run 'rake' on terminal.

To CSV file be imported successfully, change the header 'type' to 'genre'.
(The file 'netflix_titles-genre.csv' in the project is ready to import.)
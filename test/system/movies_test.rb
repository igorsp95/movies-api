require "application_system_test_case"

class MoviesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit '/'
  
    assert_selector "h1", text: "Load your CSV file to import"
  end
end

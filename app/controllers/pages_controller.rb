require 'rails/application_controller'

class PagesController < ApplicationController
  def index
    render file: 'app/views/pages/index.html'
  end
end

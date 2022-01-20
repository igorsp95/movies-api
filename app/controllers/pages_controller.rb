# frozen_string_literal: true

require 'rails/application_controller'

class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render file: 'app/views/pages/index.html'
  end
end

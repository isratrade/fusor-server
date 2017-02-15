class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  API_USERNAME = 'admin'
  API_PASSWORD = 'secret'

  SATELLITE_URL = 'http://localhost:3000/'
end

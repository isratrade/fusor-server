class Fusor::Api::V21::SettingsController < ApplicationController

  #include Api::Version21
  API_USERNAME = 'admin'
  API_PASSWORD = 'secret'

  SATELLITE_URL = 'http://localhost:9010/'

  def index
    connection = Faraday.new SATELLITE_URL do |conn|
      conn.response :json
      conn.adapter Faraday.default_adapter
      conn.basic_auth API_USERNAME, API_PASSWORD
    end

    json_response = connection.get("api/v2/settings?search=#{params[:search]}")

    render json: {settings: json_response.body["results"]}
  end

end

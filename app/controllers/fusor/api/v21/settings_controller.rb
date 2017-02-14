class Fusor::Api::V21::SettingsController < ApplicationController

  #include Api::Version21

  def index
    connection = Faraday.new 'http://localhost:3000/' do |conn|
      conn.response :json
      conn.adapter Faraday.default_adapter
    end

    json_response = connection.get("api/v2/settings?search=#{params[:search]}")

    render json: {settings: json_response.body["results"]}
  end

end

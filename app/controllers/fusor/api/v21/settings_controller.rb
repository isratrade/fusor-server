class Fusor::Api::V21::SettingsController < ApplicationController

  #include Api::Version21

  def index
    connection = Faraday.new ENV['satellite_url'] do |conn|
      conn.response :json
      conn.adapter Faraday.default_adapter
      conn.basic_auth ENV['api_username'], ENV['api_password']
    end

    json_response = connection.get("api/v2/settings?search=#{params[:search]}")

    render json: {settings: json_response.body["results"]}
  end

end

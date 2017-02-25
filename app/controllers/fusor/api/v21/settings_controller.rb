class Fusor::Api::V21::SettingsController < ApplicationController

  include Fusor::Api::V21::AuthenticationMixin

  def index
    connection = get_sat_connection
    json_response = connection.get("api/v2/settings?search=#{params[:search]}")

    render json: {settings: json_response.body["results"]}
  end

end

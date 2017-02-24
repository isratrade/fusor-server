class Fusor::Api::V21::OrganizationsController < ApplicationController

  include Fusor::Api::V21::OrganizationsMixin

  #include Api::Version21

  def index
    render json: {organizations: get_organizations}
  end

  def show
    render json: {organization: get_organization(params[:id])}
  end

  def subscriptions
    connection = Faraday.new SATELLITE_URL do |conn|
      conn.response :json
      conn.adapter Faraday.default_adapter
      conn.basic_auth API_USERNAME, API_PASSWORD
    end

    json_response = connection.get("katello/api/v2/organizations/#{params[:id]}/subscriptions")
    render json: json_response.body
  end
end

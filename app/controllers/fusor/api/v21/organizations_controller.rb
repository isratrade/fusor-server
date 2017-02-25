class Fusor::Api::V21::OrganizationsController < ApplicationController

  include Fusor::Api::V21::OrganizationsMixin
  include Fusor::Api::V21::AuthenticationMixin

  def index
    render json: {organizations: get_organizations}
  end

  def show
    render json: {organization: get_organization(params[:id])}
  end

  def subscriptions
    connection = get_sat_connection

    json_response = connection.get("katello/api/v2/organizations/#{params[:id]}/subscriptions")
    render json: json_response.body
  end
end

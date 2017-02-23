class Fusor::Api::V21::OrganizationsController < ApplicationController

  include Fusor::Api::V21::OrganizationsMixin

  #include Api::Version21

  def index
    render json: {organizations: get_organizations}
  end

  def show
    connection = Faraday.new SATELLITE_URL do |conn|
      conn.response :json
      conn.adapter Faraday.default_adapter
      conn.basic_auth API_USERNAME, API_PASSWORD
    end

    # json_response = connection.get("katello/api/v2/organizations/#{params[:id]}")

    body = {
        "id": 1,
        "name": "Default Organization",
        "title": "Default Organization",
        "created_at": "2015-11-05T08:40:31Z",
        "updated_at": "2015-11-05T08:45:36Z",
        "description": nil,
        "label": "Default_Organization",
        "owner_details": {
          "parentOwner": nil,
          "id": "ff80808150d6cd1b0150d6ce03ef0001",
          "key": "Default_Organization",
          "displayName": "Default Organization",
          "contentPrefix": "/Default_Organization/$env",
          "defaultServiceLevel": nil,
          "upstreamConsumer": {
            "id": "ff80808150d6d8ad0150f0fe88d802ac",
            "uuid": "15900031-27df-4004-be36-1203df10b238",
            "name": "jmagen2-rhci",
            "ownerId": "ff80808150d6cd1b0150d6ce03ef0001",
            "webUrl": "access.redhat.com/management/distributors/",
            "apiUrl": "https://subscription.rhn.redhat.com/subscription/consumers/",
            "created": "2015-11-10T10:43:44.472+0000",
            "updated": "2015-11-10T10:43:44.472+0000"
          },
          "logLevel": nil,
          "href": "/owners/Default_Organization",
          "created": "2015-11-05T08:40:37.103+0000",
          "updated": "2015-11-10T10:43:44.775+0000"
        },
        "service_level": nil,
        "default_content_view_id": 1,
        "library_id": 1
      }

    render json: {organization: body}

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

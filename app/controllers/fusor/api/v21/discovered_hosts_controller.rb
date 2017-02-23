class Fusor::Api::V21::DiscoveredHostsController < ApplicationController

  include Fusor::Api::V21::DiscoveredHostsMixin

  #include Api::Version21

  def index
    render json: {discovered_hosts: get_discovered_hosts}
  end

  def is_managed dh_json
    false
  end

  def is_discovered dh_json
    true
  end

  def disks_human_size dh_json
    if is_managed(dh_json)
      dh_json['facts_hash']['blockdevice_vda_size']
    elsif (dh_json)
      return "0 MB" if dh_json['disks_size'].blank? || dh_json['disks_size'].to_i == 0
      number_to_human_size(dh_json['disks_size'].to_i * 1024 * 1024)
    end
  end

  # using rename rather than update since PUT update started the provision
  # TODO add functional test
  def rename
    render json: {}

    # not_found and return false if params[:id].blank?
    # # @discovered_host = ::Host::Discovered.find(params[:id])
    # # @discovered_host.update_attributes!(:name => params[:discovered_host][:name])
    # # render :json => @discovered_host, :serializer => HostBaseSerializer

    # connection = Faraday.new SATELLITE_URL do |conn|
    #   conn.response :json
    #   conn.adapter Faraday.default_adapter
    #   conn.basic_auth API_USERNAME, API_PASSWORD
    # end

    # json_response = connection.patch("api/v2/discovered_hosts/#{params[:id]}")
    # results = json_response.body["results"].first

    # render json: {discovered_host: json_response.body["results"]}

  end

  # def is_virtual
  #   # same for both Discovered and Managed
  #   object.facts['is_virtual']
  # end

  # def environment_name
  #   return object.environment_name if is_managed
  # end

  # def hostgroup_name
  #   return object.hostgroup_name if is_managed
  # end

  # def compute_resource_name
  #   return object.compute_resource_name if is_managed
  # end

  # def domain_name
  #   return object.domain_name if is_managed
  # end

end

class Fusor::Api::V21::HostgroupsController < ApplicationController

  include Fusor::Api::V21::HostgroupsMixin
  include Fusor::Api::V21::DomainsMixin

  #include Api::Version21

  def index
    render json: {hostgroups: get_hostgroups}
  end

  def show
    @hostgroup = get_hostgroup(params[:id])
    render json: {hostgroup: @hostgroup,
                  domain: get_domain(@hostgroup[:domain_id])
                 }
  end

end

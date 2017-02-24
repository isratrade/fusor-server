class Fusor::Api::V21::DomainsController < ApplicationController

  include Fusor::Api::V21::DomainsMixin

  #include Api::Version21

  def index
    render json: {domains: get_domains}
  end

  def show
    @hostgroup =
    render json: {domain: get_domain(params[:id])}
  end

end

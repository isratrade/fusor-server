class Fusor::Api::V21::LifecycleEnvironmentsController < ApplicationController

  include Fusor::Api::V21::LifecycleEnvironmentsMixin

  #include Api::Version21

  def index
    render json: {lifecycle_environments: get_lifecycle_environments}
  end

  def show
    render json: {lifecycle_environment: get_lifecycle_environment(params[:id])}
  end

  def create
    #todo
  end

end

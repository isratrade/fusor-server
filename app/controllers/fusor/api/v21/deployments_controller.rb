class Fusor::Api::V21::DeploymentsController < ApplicationController
  before_action :set_deployment, only: [:show, :update, :destroy]

  # GET /deployments
  def index
    @deployments = Deployment.all

    render json: @deployments
  end

  # GET /deployments/1
  def show
    render json: @deployment
  end

  # POST /deployments
  def create
    @deployment = Deployment.new(deployment_params)

    if @deployment.save
      render json: @deployment, status: :created, location: @deployment
    else
      render json: @deployment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deployments/1
  def update
    if @deployment.update(deployment_params)
      render json: @deployment
    else
      render json: @deployment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deployments/1
  def destroy
    @deployment.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_deployment
    @deployment = Deployment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def deployment_params
    params.fetch(:deployment, {})
  end
end

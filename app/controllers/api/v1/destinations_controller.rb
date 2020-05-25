class Api::V1::DestinationsController < ApplicationController
  def index
    render json: Destination.all
  end

  def show
    render json: Destination.find(params[:id])
  end

  def create
    destination = Destination.create(destination_params)
    render json: destination
  end

  private

  def destination_params
    params.require('destination').permit(:name, :zip, :description, :image_url)
  end
end

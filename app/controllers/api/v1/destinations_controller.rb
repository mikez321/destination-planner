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

  def update
    destination = Destination.find(params[:id])
    destination.update(destination_params)
    render json: destination
  end

  def destroy
    destination = Destination.find(params[:id])
    destination.delete
    render json: destination
  end

  private

  def destination_params
    params.require('destination').permit(:name, :zip, :description, :image_url)
  end
end

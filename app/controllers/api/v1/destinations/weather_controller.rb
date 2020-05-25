class Api::V1::Destinations::WeatherController < ApplicationController
  def show
    destination = Destination.find(params[:id])

    weather = destination.weather.json_hash
    render json: weather
  end
end

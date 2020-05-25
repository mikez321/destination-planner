class Destination < ApplicationRecord
  def weather
    Weather.new(name)
  end

  def has_weather?
    Weather.new
  end
end

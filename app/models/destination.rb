class Destination < ApplicationRecord
  def weather
    Weather.new(name)
  end
end

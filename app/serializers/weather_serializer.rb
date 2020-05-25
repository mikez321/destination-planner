class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date, :current, :summary, :image
end

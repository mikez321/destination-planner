class WeatherService
  def current_weather(destination)
    response = Faraday.get("https://api.openweathermap.org/data/2.5/weather?appid=#{ENV['WEATHER_KEY']}&q=#{destination}&units=imperial")
    JSON.parse(response.body, symbolize_names: true)
  end
end

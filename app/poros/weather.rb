class Weather
  # attr_reader :date, :current, :high, :low, :summary
  # def initialize(destination)
  #   weather_info = get_weather(destination)
  #   @date = Date.today
  #   @current = weather_info[:main][:temp]
  #   @high = weather_info[:main][:temp_max]
  #   @low = weather_info[:main][:temp_min]
  #   @summary = weather_info[:weather].first[:description]
  # end

  def initialize(destination)
    @weather_info = get_weather(destination)
  end

  def date
    Date.today if !@weather_info[:message] = 'city not found'
    "unavailable"
  end

  def current
    weather_info[:main][:temp] if !@weather_info[:message] = 'city not found'
    "unavailable"
  end

  def high
    weather_info[:main][:temp_max] if !@weather_info[:message] = 'city not found'
    'unavailable'
  end

  def low
    weather_info[:main][:temp_min] if !@weather_info[:message] = 'city not found'
    'unavailable'
  end

  def summary
    weather_info[:weather].first[:description] if !@weather_info[:message] = 'city not found'
    'unavailable'
  end

  def get_weather(destination)
    WeatherService.new.current_weather(destination)
  end
end

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

  def image
    'https://ctl.s6img.com/society6/img/E54QZiyFd-Fu7kFpNdgXFnKycJc/w_700/prints/~artwork/s6-original-art-uploads/society6/uploads/misc/eb37338848f64aefb6b83b59757c2457/~~/good-morning-sunshine1225559-prints.jpg'
  end

  def get_weather(destination)
    WeatherService.new.current_weather(destination)
  end
end

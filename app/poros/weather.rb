class Weather
  def initialize(destination)
    @weather_info = get_weather(destination)
  end

  def date
    if @weather_info[:message].nil?
      Date.today
    else
      "unavailable"
    end
  end

  def current
    if @weather_info[:message].nil?
      @weather_info[:main][:temp]
    else
      'unavailable'
    end
  end

  def high
    if @weather_info[:message].nil?
      @weather_info[:main][:temp_max]
    else
      'unavailable'
    end
  end

  def low
    if @weather_info[:message].nil?
      @weather_info[:main][:temp_min]
    else
      'unavailable'
    end
  end

  def summary
    if @weather_info[:message].nil?
      @weather_info[:weather].first[:description]
    else
      'unavailable'
    end
  end

  def image
    if @weather_info[:meassage].nil?
      get_image(@weather_info[:weather].first[:main])
    else
      'unavailable'
    end
  end

  def json_hash
    info = { response: @weather_info[:cod],
             data:
             {
               cityName: @weather_info[:name],
               weather: @weather_info[:weather],
               main: @weather_info[:main],
               wind: @weather_info[:wind],
               rain: @weather_info[:rain],
               image: image
             }
            }
    info.to_json
  end

  private

  def get_weather(destination)
    WeatherService.new.current_weather(destination)
  end

  def get_image(keyword)
    GiphyService.new.weather_image(keyword)
  end
end

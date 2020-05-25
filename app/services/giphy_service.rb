class GiphyService
  def weather_image(weather)
    response = conn.get('search') do |conn|
      conn.params['q'] = weather
      conn.params['limit'] = '1'
    end
    json = JSON.parse(response.body, symbolize_names: true)
    image = json[:data].first[:images][:fixed_width][:url]
  end

  def conn
    Faraday.new('https://api.giphy.com/v1/gifs/') do |faraday|
      faraday.params['api_key'] = ENV['GIPHY_KEY']
    end
  end
end

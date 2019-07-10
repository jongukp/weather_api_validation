require 'httparty'
require 'benchmark'
# Weather API
class WeatherAPI
  include BaseAPI
  include HTTParty

  # List weather location data be this service
  #
  # @return [HTTParty::Response] Result from the web server, containing JSON results of weather location data
  def points(lat, long)
    uri = "/points/#{lat},#{long}"
    self.class.get(uri)
  end

  def hourly_forecast(uri)
    self.class.get(uri)
  end
end

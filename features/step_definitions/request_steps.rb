When(/^I send GET request to \/points with following lat, long coordinates:$/) do |table|
  coordinates = table.rows.flatten
  @response = @weather_api.points(coordinates[0], coordinates[1])
  @response_time = @response.duration
end

When(/^I follow the forecast link$/) do
  uri = JSON.parse(@response.parsed_response)['properties']['forecastHourly']
  @response = @weather_api.hourly_forecast(uri)
end

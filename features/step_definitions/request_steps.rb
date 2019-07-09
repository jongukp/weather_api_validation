When(/^I send GET request with valid lat, long coordinates$/) do
  lat = 33.946213
  long = -84.334648
  @response = @weather_api.points(lat, long)
end

When(/^I send GET request with invalid lat, long coordinates$/) do
  lat = 10
  long = 20
  @response = @weather_api.points(lat, long)
end

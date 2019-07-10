Then(/^I should get (\d+) response code$/) do |code|
  expect(@response.code).to be code
end

Then(/^the City is "([^"]*), ([^"]*)"$/) do |city, state|
  city_properties = JSON.parse(@response.parsed_response)['properties']['relativeLocation']['properties']
  result_city = city_properties['city']
  result_state = city_properties['state']

  expect(result_city).to eq city
  expect(result_state).to eq state
end

Then(/^the response payload fits the required JSON schema$/) do
  schema_path = CommonVar::SCHEMA_DIRECTORY + CommonVar::POINTS_SCHEMA
  # TODO: ASK - Do I need to create another schema for error response?
  JSON::Validator.validate!(schema_path, @response.parsed_response, strict: true)
end

Then(/^the current temperature is about (\d+) degrees$/) do |temprature|
  # TODO: Current Assumtion is that the first payload is always the current hour. Still need to add a function to validate this assumption
  current_temp = JSON.parse(@response.parsed_response)['properties']['periods'][0]['temperature']
  expect(current_temp).to be_between(temprature - CommonVar::TEMPERATURE_THRESHOLD,
                                     temprature + CommonVar::TEMPERATURE_THRESHOLD)
end

Then(/^the response time is less than (\d+) ms$/) do |milli_sec|
  expect(@response_time).to be < milli_sec
end

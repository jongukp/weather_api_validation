Then(/^I should get (\d+) response code$/) do |code|
  expect(@response.code).to be code
end

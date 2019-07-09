Feature: Test /points endpoint
  Scenario: Sending GET request to /point endpoint with valid lat, long
    When I send GET request with valid lat, long coordinates
    Then I should get 200 response code

  Scenario: Sending GET request to /point endpoint with invalid lat, long
    When I send GET request with invalid lat, long coordinates
    Then I should get 404 response code
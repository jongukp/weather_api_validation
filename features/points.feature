Feature: Test /points endpoint
  Scenario: Sending GET request to /points endpoint with valid lat, long
    When I send GET request to /points with following lat, long coordinates:
      | latitude  | longitude  |
      | 33.946213 | -84.334648 |
    Then I should get 200 response code
    And the City is "Dunwoody, GA"
    And the response payload fits the required JSON schema
    When I follow forecast link
    Then the current temperature is about 85 degrees
    And the response time is less than 20 ms

  Scenario: Sending GET request to /point endpoint with invalid lat, long
    When I send GET request to /points with following lat, long coordinates:
      | latitude  | longitude  |
      | 10        | 20         |
    Then I should get 404 response code
    And the response payload fits the required JSON schema

Feature: Test /points endpoint
  Scenario: Sending GET request to /points endpoint with valid lat, long
    When I send GET request to /points with following lat, long coordinates:
      | latitude  | longitude  |
      | 33.946213 | -84.334648 |
    Then I should get 200 response code
    And the City is "Dunwoody, GA"
    And the response payload fits the required JSON schema
    When I follow the forecast link
    Then the current temperature is about 85 degrees
    And the response time is less than 20 ms

  Scenario: Sending GET request to /point endpoint with invalid lat, long that does not have data point
    When I send GET request to /points with following lat, long coordinates:
      | latitude  | longitude  |
      | 10        | 20         |
    Then I should get 404 response code
    And the response payload fits the required JSON schema

  Scenario: Sending GET request to /point endpoint with invalid lat, long format (string)
    When I send GET request to /points with following lat, long coordinates:
      | latitude  | longitude  |
      | thirty    | eighty     |
    Then I should get 404 response code

  Scenario: Sending GET request to /point endpoint with invalid lat, long format (empty string)
    When I send GET request to /points with following lat, long coordinates:
      | latitude  | longitude  |
      | ''        | ''         |
    Then I should get 404 response code

  Scenario: Sending GET request to /point endpoint with invalid lat, long format (null)
    When I send GET request to /points with following lat, long coordinates:
      | latitude  | longitude  |
      | null      | nil        |
    Then I should get 404 response code

  Scenario: Sending GET request to /point endpoint with invalid lat, long range
    When I send GET request to /points with following lat, long coordinates:
      | latitude  | longitude  |
      | 100       | 200        |
    Then I should get 404 response code

  Scenario: Sending GET request to /point endpoint with North Pole lat, long (just for fun - invalid data point)
    When I send GET request to /points with following lat, long coordinates:
      | latitude  | longitude  |
      | 90        | 0          |
    Then I should get 404 response code

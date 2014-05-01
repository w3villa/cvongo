Feature: City Scrapper

  I want to scrap all the Cities

  Scenario: I want to create a property
    When I go to the 99acres sign in page
    And I log-in in 99acres
    And I press "Sell / Rent a Property"
    And I wait for 2 seconds
    And I switch window
    And I select "4 FREE Plain Listing(s)" from "ListingCode"
    And I select "Residential Apartment" from "Type"
    Then I should scrap cities
    Then I should break
@javascript
Feature: Browse currencies
  In order to check wether or not a currency is available in the catalog
  As a user
  I need to be able to see active and inactive currencies in the catalog

  Background:
    Given the following currencies:
      | code | activated |
      | USD  | yes       |
      | EUR  | yes       |
      | GBP  | no        |
    And I am logged in as "admin"

  Scenario: Successfully display currencies
    Given I am on the currencies page
    Then I should see activated currencies USD and EUR
    And I should see deactivated currency GBP

  Scenario: Successfully display filters
    Given I am on the currencies page
    Then I should see the filters "Code" and "Activated"

  Scenario: Successfully display columns
    Given I am on the currencies page
    Then the grid should contain 3 elements
    And I should see the columns Code and Activated

  Scenario: Successfully activate a currency
    Given I am on the currencies page
    When I activate the GBP currency
    Then I should see activated currencies GBP, USD and EUR

  Scenario: Successfully deactivate a currency
    Given I am on the currencies page
    When I deactivate the USD currency
    Then I should see activated currency EUR
    And I should see deactivated currencies GBP and USD

  Scenario: Successfully sort currencies by code ascending
    Given I am on the currencies page
    Then I should see currencies sorted as EUR, GBP and USD
    When I sort by "code" value ascending
    Then I should see currencies sorted as EUR, GBP and USD

  Scenario: Successfully sort currencies by code descending
    Given I am on the currencies page
    Then I should see currencies sorted as EUR, GBP and USD
    When I sort by "code" value descending
    Then I should see currencies sorted as USD, GBP and EUR

  Scenario: Successfully sort currencies by activated ascending
    Given I am on the currencies page
    Then I should see currencies sorted as EUR, GBP and USD
    When I sort by "Activated" value ascending
    Then I should see currencies sorted as USD, EUR and GBP

  Scenario: Successfully sort currencies by activated descending
    Given I am on the currencies page
    Then I should see currencies sorted as EUR, GBP and USD
    When I sort by "Activated" value descending
    Then I should see currencies sorted as GBP, USD and EUR

  Scenario: Successfully filter by code
    Given I am on the currencies page
    Then the grid should contain 3 elements
    And I should see currencies GBP, USD and EUR
    And I should see the filters "Code" and "Activated"
    When I filter by "Code" with value "U"
    Then the grid should contain 2 elements
    And I should see currencies USD and EUR

  Scenario: Successfully filter by code
    Given I am on the currencies page
    Then the grid should contain 3 elements
    And I should see currencies GBP, USD and EUR
    And I should see the filters "Code" and "Activated"
    When I filter by "Activated" with value "yes"
    Then the grid should contain 2 elements
    And I should see currencies USD and EUR

  Scenario: Successfully filter by code
    Given I am on the currencies page
    Then the grid should contain 3 elements
    And I should see currencies GBP, USD and EUR
    And I should see the filters "Code" and "Activated"
    When I filter by "Activated" with value "no"
    Then the grid should contain 1 element
    And I should see currencies GBP

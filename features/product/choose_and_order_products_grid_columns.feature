@javascript
Feature: Choose and order product grids columns
  In order to works with data that I'm interested in the product datagrid
  As Julia
  I need to be able to choose and order product grids columns

  Scenario: Succesfully display all columns by default
    Given a "footwear" catalog configuration
    And the following products:
      | sku     |
      | sandals |
      | basket  |
    And I am logged in as "Julia"
    And I am on the products page
    Then I should see the columns Sku, Family, Status, Complete, Created At, Updated At, Groups, Color, Name, Price, Rating and Size

  Scenario: Succesfully hide some columns

  Scenario: Succesfully order some columns

  Scenario: Fail to hide the identifier column

  Scenario: Fail to sort the identifier column

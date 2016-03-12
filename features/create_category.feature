Feature: create new or edit category
  As an admin
  I want to be able to create new or edit categories
  so that articles can be categorized
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: successfully create new category
    Given I follow "Categories"
    Then I should be on the categories page
    When I fill in "category_name" with "Food"
    And I fill in "category_description" with "Edibles"
    And I press "Save"
    Then I should see "Category was successfully saved."
    
  Scenario: unsuccessfully create new category
    Given I follow "Categories"
    Then I should be on the categories page
    And I press "Save"
    Then I should see "Category could not be saved."
    
  Scenario: edit a category
    Given I follow "Categories"
    Then I should be on the categories page
    When I fill in "category_name" with "Food"
    And I fill in "category_description" with "Edibles"
    And I press "Save"
    And I follow "Food"
    And I fill in "category_name" with "Yummy"
    And I press "Save"
    Then I should see "Yummy"
    And I should not see "Food"
    
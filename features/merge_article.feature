Feature: Merge Articles
  As a blog administrator
  In order to condense similar articles
  I want to be able to merge articles on my blog

  Background:
    Given the blog is set up
    And the following articles exist:
    |title                          |body                                                                              |author  |
    |Welcome to Tiffany's Thoughts  |Hello there. My name is Tiffany H Lam. And I really want myself some boba.        |admin   | 
    |Trader Joe's Raspberry Tart    |I am constantly thinking about TJ's Raspberry Tart. Best tart in town hands down. |Tiffany |
    # And the following comments exist:
    # |author   |body               |article_id|
    # |Joyce    |I just had boba!   |2         |
    # |Mandy    |I love tart too.   |3         |
  Scenario: A non-admin cannot merge articles
    Given I am logged into a non-admin panel 
    And I follow "All Articles"
    Then I should see "Welcome to Tiffany's Thoughts"
    And I follow "Welcome to Tiffany's Thoughts"
    Then I should not see "Merge Articles"
    
  Scenario: Successfully merge articles
    Given I am logged into the admin panel 
    And I follow "All Articles"
    And I follow "Welcome to Tiffany's Thoughts"
    Then I should see "Merge Articles"
    When I fill in "Article ID" with "11" 
    And I press "Merge"
    Then I should be on the manage articles page #needs path
    #checks title
    And I should see "Welcome to Tiffany's Thoughts"
    And I should not see "Trader Joe's Raspberry Tart"
    #checks body
    When I follow "Welcome to Tiffany's Thoughts"
    And I should see "Hello there. My name is Tiffany H Lam. And I really want myself some boba."
    And I should see "I am constantly thinking about TJ's Raspberry Tart. Best tart in town hands down."
    #checks comments
    When I follow "Comments"
    Then I should see "Welcome to Tiffany's Thoughts"
    And I should not see "Trader Joe's Raspberry Tart"
    And I should see "I just had boba!"
    And I should see "I love tart too."
    #checks author
    When I follow "All Articles"
    Then I should see "admin"
    And I should not see "Tiffany"
    
    

    
    
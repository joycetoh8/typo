Feature: Merge Articles
  As a blog administrator
  In order to condense similar articles
  I want to be able to merge articles on my blog

  Background:
    Given the blog is set up
    # And the following articles exist:
    # |title                          |body                                                                              |author  |
    # |Welcome to Tiffany's Thoughts  |Hello there. My name is Tiffany H Lam. And I really want myself some boba.        |admin   | 
    # |Trader Joe's Raspberry Tart    |I am constantly thinking about TJ's Raspberry Tart. Best tart in town hands down. |Tiffany |
    # And the following comments exist:
    # |author   |body               |article_id|
    # |Joyce    |I just had boba!   |2         |
    # |Mandy    |I love tart too.   |3         |
  
  Scenario: A non-admin cannot merge articles
    Given I am logged into a non-admin panel 
    And I follow "New Article"
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should see "Foobar"
    And I follow "Foobar"
    #And I click on "Welcome to Tiffany's Thoughts"
    Then I should not see "Merge Articles"
    
  Scenario: Successfully merge articles
    Given I am logged into a non-admin panel 
    And I follow "New Article"
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"

    Given I have logged out
    When I am logged into the admin panel 
    And I follow "New Article"
    When I fill in "article_title" with "Foobar2"
    And I fill in "article__body_and_extended_editor" with "Second body."
    And I press "Publish"
    #comment for first article
    When I am on the home page
    And I follow "Foobar"
    And I fill in "comment_author" with "Tiffany"
    And I fill in "comment_body" with "Hello."
    And I press "comment"
    #comment for second article
    When I am on the home page
    And I follow "Foobar2"
    And I fill in "comment_author" with "Joyce"
    And I fill in "comment_body" with "Byeeee."
    And I press "comment"
    
    When I am on the manage articles page
    And I follow "Foobar"
    Then I should see "Merge Articles"
    When I fill in "merge_id" with "3" 
    And I press "Merge"
    Then I should be on the manage articles page #needs path
    #checks title
    And I should see "Foobar"
    And I should not see "Foobar2"
    #checks body
    When I follow "Foobar"
    And I should see "Lorem Ipsum."
    And I should see "Second body."
    #checks comments
    When I follow "Comments"
    Then I should see "Foobar"
    And I should not see "Foobar2"
    And I should see "Hello."
    And I should see "Byeeee."
    #checks author
    When I follow "All Articles"
    Then I should see "admin"
    #And I should not see "Tiffany"
    
    

    
    
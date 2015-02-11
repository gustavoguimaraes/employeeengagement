Feature: Creating post
  As a user
  I need to create a post
  So that I show my employees about social projects
  
  Scenario: Signin
    Given I am a user
    When I login
    And I propose a post
    Then the state of the post should be pending
    
  Scenario: Signin
    Given I am a company admin
    When I login
    And I propose a post
    Then the state of the post should be pending
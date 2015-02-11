Feature: Creating post
  As a user
  I need to create a post
  So that I show my employees about social projects

  Scenario: Creating a post as a user
    Given I am a user
    When I login
    And I propose a post
    Then I should not see the post

  Scenario: Creating a post as a company admin
    Given I am a company admin
    When I login
    And I propose a post
    Then I should see the post to approve or reject it

  Scenario: Seeing a post as a user
    Given I am a user
    When I login
    And the post is approved
    And I am on the dashboard page
    Then I should see the post

Feature: Adding Social Media to Account
  as a User
  I may want to add may social media credentials to the application
  So I can share with my network articles I find

  Scenario: Link Twitter
    Given I am logged in as a user
    When I am on the dashboard page
    Then I should see "Connect with Twitter"

    When I click on "Connect with Twitter"
    Then I should see "Twitter has been connected to your account!"

  Scenario: Link Facebook
    Given I am logged in as a user
    When I am on the dashboard page
    Then I should see "Connect with Facebook"

    When I click on "Connect with Facebook"
    Then I should see "Facebook has been connected to your account!"

  Scenario: Link LinkedIn
    Given I am logged in as a user
    When I am on the dashboard page
    Then I should see "Connect with LinkedIn"

    When I click on "Connect with LinkedIn"
    Then I should see "Linkedin has been connected to your account!"
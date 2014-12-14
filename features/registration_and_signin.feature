Feature: Registration and Signin
  As a user
  I need to be able to signup or sign in if already registered to the application
  So that I see the app dashboard

  Scenario: Signup
    Given I am a visitor
    When I am on the registration page
    And I register to the site
    Then I should see the app dashboard information

  Scenario: Signin
    Given I am a user
    When I login
    Then I should see the app dashboard information

    Scenario: Accessing the Admin Page
    Given I am an Admin
    When I login as an admin
    Then I should see the Admin page
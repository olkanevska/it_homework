Feature: Edit feature type issue in my project

  As a User
  I want to edit feature type issue in my project. I have to choose one of three feature types issue: Bug, Feature or Support.

  @positive
  Scenario: Positive Edit feature type issue in my project
    Given I am on Registration page
    And I submit registration form with valid data
    And I create project
    When I edit feature type issue to: Feature
    Then I edited feature type issue in my project for a: Feature
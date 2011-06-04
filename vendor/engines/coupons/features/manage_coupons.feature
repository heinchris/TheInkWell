@coupons
Feature: Coupons
  In order to have coupons on my website
  As an administrator
  I want to manage coupons

  Background:
    Given I am a logged in refinery user
    And I have no coupons

  @coupons-list @list
  Scenario: Coupons List
   Given I have coupons titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of coupons
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @coupons-valid @valid
  Scenario: Create Valid Coupon
    When I go to the list of coupons
    And I follow "Add New Coupon"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 coupon

  @coupons-invalid @invalid
  Scenario: Create Invalid Coupon (without title)
    When I go to the list of coupons
    And I follow "Add New Coupon"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 coupons

  @coupons-edit @edit
  Scenario: Edit Existing Coupon
    Given I have coupons titled "A title"
    When I go to the list of coupons
    And I follow "Edit this coupon" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of coupons
    And I should not see "A title"

  @coupons-duplicate @duplicate
  Scenario: Create Duplicate Coupon
    Given I only have coupons titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of coupons
    And I follow "Add New Coupon"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 coupons

  @coupons-delete @delete
  Scenario: Delete Coupon
    Given I only have coupons titled UniqueTitleOne
    When I go to the list of coupons
    And I follow "Remove this coupon forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 coupons
 
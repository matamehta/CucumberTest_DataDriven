@logout
Feature: Logout user

  Scenario Outline: Check for logout button appeared once user is logged on
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having <login_access_type> "<login_access_value>"
    Then I wait 5 ms for element having xpath "<access_value>" to display
  Examples:
    |Dataset|login_access_type|login_access_value|access_value|
    |Testdata1|buttonText       |Login             |//p[contains(text(),'Logout')]|

  Scenario Outline: Check for logout button return back to user login page and username/password is blank
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having <login_access_type> "<login_access_value>"
    Then I click on element having xpath "<logout_access_value>"
    Then I assert element having model "<user_access_value>" and has class "<invalid_class_name>" should be present
    Then I assert element having model "<password_access_value>" and has class "<invalid_class_name>" should be present
  Examples:
      |Dataset|user_access_value|login_access_type|login_access_value|invalid_class_name|logout_access_value|
      |Testdata1|user.name               |buttonText       |Login             | ng-invalid-required            |//p[contains(text(),'Logout')]|


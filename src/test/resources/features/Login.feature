@Login
Feature: user login

  Scenario Outline: Check all mandatory field in login page is marked with asterix  *
    Given I am in app loginpage
    Then element having xpath"username" from "<Dataset>"  should be present
    Then element having xpath"password" from "<Dataset>"  should be present
  Examples:
      |Dataset|
      |Login1|

  Scenario Outline: Check for text field username and password appeared in login page, Check submit button "Login" exist
    Given I am in app loginpage
    Then element having model"username" from "<Dataset>"  should be present
    Then element having model"password" from "<Dataset>"  should be present
    Then element having buttonText"login" from "<Dataset>"  should be present
  Examples:
    |Dataset|
    |Login2       |

  Scenario Outline: Check for successful login using valid credentials and verify repeater element to show "employee list" appeared in home page
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having <login_access_type> "<login_access_value>"
    Then I wait 5 ms for element having <emp_list_access_type> "<emp_list_access_value>" to display
  Examples:
    |Dataset|login_access_type|login_access_value|emp_list_access_type|emp_list_access_value|
    |Testdata1 |buttonText       |Login             |repeater            |employee in employees|


  Scenario Outline: Check for validation error if either or both username and password is incorrect and Login button is clicked
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having <login_access_type> "<login_access_value>"
    Then I wait 5 ms for element having <invalid_login_access_type> "<invalid_login_access_value>" to display
    Then I assert element having <invalid_login_access_type> "<invalid_login_access_value>" should have text as "<error_message>"

    Examples:
      |Dataset|login_access_type|login_access_value|invalid_login_access_type|invalid_login_access_value|error_message|
      |Testdata2 |buttonText       |Login             |css            |.error-message.ng-binding|Invalid username or password!|
      |Testdata3 |buttonText       |Login             |css            |.error-message.ng-binding|Invalid username or password!|
      |Testdata4    |buttonText       |Login             |css            |.error-message.ng-binding|Invalid username or password!|



  Scenario Outline:  Check for validation error if username field blank and Login button is clicked
    Given I am in app loginpage
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having <login_access_type> "<login_access_value>"
    Then I wait 5 ms for element having <blank_login_access_type> "<blank_login_access_value>" to display
  Examples:
      |Dataset|login_access_type|login_access_value|blank_login_access_type|blank_login_access_value|
      |Testdata6|buttonText       |Login             |css            |.ng-pristine.ng-invalid.ng-invalid-required|

  Scenario Outline:  Check for validation error if password field blank and Login button is clicked
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    When I click on element having <login_access_type> "<login_access_value>"
    Then I wait 5 ms for element having <blank_login_access_type> "<blank_login_access_value>" to display
  Examples:
      |Dataset|login_access_type|login_access_value|blank_login_access_type|blank_login_access_value|
      |Testdata7   |buttonText       |Login             |css            |.ng-pristine.ng-invalid.ng-invalid-required|


  Scenario Outline:  Check for validation error if both username and password are blank and Login button is clicked
    Given I am in app loginpage
    When I click on element having <login_access_type> "<login_access_value>"
    Then I wait 5 ms for element having <blank_login_access_type> "<blank_login_access_value>" to display
  Examples:
      |login_access_type|login_access_value|blank_login_access_type|blank_login_access_value|
      |buttonText       |Login             |css            |.ng-pristine.ng-invalid.ng-invalid-required|


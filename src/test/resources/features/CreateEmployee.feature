@Create
Feature: Create employee

  Scenario Outline: Check for create button is enabled in homepage
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I wait 10 ms for element having id "bAdd" to be enabled
  Examples:
    |Dataset|
    |Testdata1       |

  Scenario Outline: Check for all fields appeared when create button is clicked
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I wait 20 ms for element having id "bAdd" to be enabled
    When I click on element having id "bAdd"
    Then element having model"firstname" from "<Dataset>"  should be present
    Then element having model"lastname" from "<Dataset>"  should be present
    Then element having model"startdate" from "<Dataset>"  should be present
    Then element having model"email" from "<Dataset>"  should be present
  Examples:
    |Dataset|
    |CreateEmp1|


  Scenario Outline: Check for validation error if first name is not entered and add button is clicked
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I wait 15 ms for element having id "bAdd" to be enabled
    When I click on element having id "bAdd"
    Then I wait 5 ms for element having buttonText "Add" to display
    And I enter "<Dataset>" into "lastname"input field having <lastname_type> "<lastname_value>"
    And I enter "<Dataset>" into "startdate"input field having <startdate_type> "<startdate_value>"
    And I enter "<Dataset>" into "email"input field having <email_type> "<email_value>"
    When I click on element having buttonText "Add"
    Then I wait 10 ms for element having <blank_login_access_type> "<blank_login_access_value>" to display

    Examples:
      |Dataset|lastname_type|lastname_value|startdate_type|startdate_value|email_type|email_value|blank_login_access_type|blank_login_access_value|
      |CreateEmp2|model          |selectedEmployee.lastName|model|selectedEmployee.startDate|model|selectedEmployee.email|css            |.ng-pristine.ng-invalid.ng-invalid-required|

  Scenario Outline: Check for validation error if last name is not entered and add button is clicked
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I wait 15 ms for element having id "bAdd" to be enabled
    When I click on element having id "bAdd"
    Then I wait 5 ms for element having buttonText "Add" to display
    And I enter "<Dataset>" into "firstname"input field having <firstname_type> "<firstname_value>"
    And I enter "<Dataset>" into "startdate"input field having <startdate_type> "<startdate_value>"
    And I enter "<Dataset>" into "email"input field having <email_type> "<email_value>"
    When I click on element having buttonText "Add"
    Then I wait 10 ms for element having <blank_login_access_type> "<blank_login_access_value>" to display

    Examples:
      |Dataset|firstname_type|firstname_value|startdate_type|startdate_value|email_type|email_value|blank_login_access_type|blank_login_access_value|
      |CreateEmp2|model          |selectedEmployee.firstName|model|selectedEmployee.startDate|model|selectedEmployee.email|css            |.ng-pristine.ng-invalid.ng-invalid-required|

  Scenario Outline: Check for validation error if start date is not entered and add button is clicked
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I wait 15 ms for element having id "bAdd" to be enabled
    When I click on element having id "bAdd"
    Then I wait 5 ms for element having buttonText "Add" to display
    And I enter "<Dataset>" into "firstname"input field having <firstname_type> "<firstname_value>"
    And I enter "<Dataset>" into "lastname"input field having <lastname_type> "<lastname_value>"
    And I enter "<Dataset>" into "email"input field having <email_type> "<email_value>"
    When I click on element having buttonText "Add"
    Then I wait 10 ms for element having <blank_login_access_type> "<blank_login_access_value>" to display

    Examples:
      |Dataset|firstname_type|firstname_value|lastname_type|lastname_value|email_type|email_value|blank_login_access_type|blank_login_access_value|
      |CreateEmp2|model          |selectedEmployee.firstName|model|selectedEmployee.lastName|model|selectedEmployee.email|css            |.ng-pristine.ng-invalid.ng-invalid-required|

  Scenario Outline: Check for validation error if email is not entered and add button is clicked
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I wait 15 ms for element having id "bAdd" to be enabled
    When I click on element having id "bAdd"
    Then I wait 5 ms for element having buttonText "Add" to display
    And I enter "<Dataset>" into "firstname"input field having <firstname_type> "<firstname_value>"
    And I enter "<Dataset>" into "lastname"input field having <lastname_type> "<lastname_value>"
    And I enter "<Dataset>" into "startdate"input field having <startdate_type> "<startdate_value>"
    When I click on element having buttonText "Add"
    Then I wait 10 ms for element having <blank_login_access_type> "<blank_login_access_value>" to display

    Examples:
      |Dataset|firstname_type|firstname_value|lastname_type|lastname_value|startdate_type|startdate_value|blank_login_access_type|blank_login_access_value|
      |CreateEmp2|model          |selectedEmployee.firstName|model|selectedEmployee.lastName|model|selectedEmployee.startDate|css            |.ng-pristine.ng-invalid.ng-invalid-required|


  Scenario Outline: Check for validation error if startdate entered is invalid and add button is clicked
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I wait 15 ms for element having id "bAdd" to be enabled
    When I click on element having id "bAdd"
    Then I wait 5 ms for element having buttonText "Add" to display
    And I enter "<Dataset>" into "firstname"input field having <firstname_type> "<firstname_value>"
    And I enter "<Dataset>" into "lastname"input field having <lastname_type> "<lastname_value>"
    And I enter "<Dataset>" into "invalid_startdate"input field having <startdate_type> "<startdate_value>"
    And I enter "<Dataset>" into "email"input field having <email_type> "<email_value>"
    When I click on element having buttonText "Add"
    Then I accept alert
    Then element having <startdate_type> "<startdate_value>" should have attribute "title" with value "<value>"

    Examples:
      |Dataset|firstname_type|firstname_value|lastname_type|lastname_value|startdate_type|startdate_value|email_type|email_value|value|
      |CreateEmp2|model          |selectedEmployee.firstName|model|selectedEmployee.lastName|model |selectedEmployee.startDate|model|selectedEmployee.email|Please enter a date formatting YYYY-MM-DD           |

  Scenario Outline: Check the success of create operation when all fields are filled correctly and newly added employee is listed in home page
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I wait 15 ms for element having id "bAdd" to be enabled
    When I click on element having id "bAdd"
    Then I wait 5 ms for element having buttonText "Add" to display
    And I enter "<Dataset>" into "firstname"input field having <firstname_type> "<firstname_value>"
    And I enter "<Dataset>" into "lastname"input field having <lastname_type> "<lastname_value>"
    And I enter "<Dataset>" into "startdate"input field having <startdate_type> "<startdate_value>"
    And I enter "<Dataset>" into "email"input field having <email_type> "<email_value>"
    When I click on element having buttonText "Add"
    Then I assert repeater element having "employee in employees" should have "emp_full_name" from "<Dataset>" have text present


    Examples:
      |Dataset|firstname_type|firstname_value|lastname_type|lastname_value|startdate_type|startdate_value|email_type|email_value|
      |CreateEmp2|model          |selectedEmployee.firstName|model|selectedEmployee.lastName|model |selectedEmployee.startDate|model|selectedEmployee.email|

  Scenario Outline: Check edit and delete button get enabled when employee from the list is selected
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I wait 15 ms for element having id "bAdd" to be enabled
    When I click on repeater element having repeater "employee in employees"
    Then element having id "<button_id>" should be enabled
  Examples:
    |button_id|Dataset|
    |bEdit         |Testdata1|
    |bDelete              |Testdata1|




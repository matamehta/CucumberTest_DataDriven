@Edit
Feature: Edit employee


  Scenario Outline: Check for edit button is disabled in home page
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I take screenshot
    Then I assert element having id "bEdit" and has class "disabled" should be present
  Examples:
    |Dataset|
    |Testdata1       |

  Scenario Outline: Check for edit button gets enabled when employee from list is selected in home page
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    When I click on repeater element having repeater "employee in employees"
    Then element having id "bEdit" should be enabled
  Examples:
    |Dataset|
    |Testdata1       |

  Scenario Outline: Check for all field in a employee form have vaild data when edit button is clicked
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I click on repeater element having repeater "employee in employees"
    Then I click on element having id "bEdit"
    Then I assert element having model "<firstname_value>" and has class "<valid_class_name>" should be present
    Then I assert element having model "<lastname_value>" and has class "<valid_class_name>" should be present
    Then I assert element having model "<startdate_value>" and has class "<valid_class_name>" should be present
    Then I assert element having model "<email_value>" and has class "<valid_class_name>" should be present
    Then element having buttonText"update" from "<Dataset>"  should be present
    Then element having buttonText "Update" should be enabled
    Then element having xpath"deletebutton" from "<Dataset>"  should be present
    Then element having xpath "<button_value>" should be enabled
  Examples:
      |Dataset|firstname_value|lastname_value|startdate_value|email_value|valid_class_name|button_value|
      |Testdata1       |selectedEmployee.firstName|selectedEmployee.lastName|selectedEmployee.startDate |selectedEmployee.email |ng-valid-required|//p[contains(text(),'Delete')]|


  Scenario Outline: Check for first name field is editable and updated correctly
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
    Then I scroll to bottom of page
    Then I click on repeater element having text "employee in employees" should have "emp_full_name" from  "<Dataset>" to be clicked
    When I click on element having id "bEdit"
    Then I clear input field having <firstname_type> "<firstname_value>"
    And I enter "<Dataset>" into "firstname_newname"input field having <firstname_type> "<firstname_value>"
    When I click on element having buttonText "Update"
    Then I assert repeater element having "employee in employees" should have "new_emp_name" from "<Dataset>" have text present

    Examples:
      |Dataset|firstname_type|firstname_value|lastname_type|lastname_value|startdate_type|startdate_value|email_type|email_value|
      |Testdata8 |model          |selectedEmployee.firstName|model|selectedEmployee.lastName|model |selectedEmployee.startDate|model|selectedEmployee.email|


  Scenario Outline: Check for lastname field is editable and updated correctly
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
    Then I scroll to bottom of page
    Then I click on repeater element having text "employee in employees" should have "emp_full_name" from  "<Dataset>" to be clicked
    When I click on element having id "bEdit"
    Then I take screenshot
    Then I clear input field having <lastname_type> "<lastname_value>"
    And I enter "<Dataset>" into "lastname_newname"input field having <lastname_type> "<lastname_value>"
    When I click on element having buttonText "Update"
    Then I scroll to bottom of page
    Then I assert repeater element having "employee in employees" should have "new_emp_name" from "<Dataset>" have text present

    Examples:
      |Dataset|firstname_type|firstname_value|lastname_type|lastname_value|startdate_type|startdate_value|email_type|email_value|
      |Testdata9  |model          |selectedEmployee.firstName|model|selectedEmployee.lastName|model |selectedEmployee.startDate|model|selectedEmployee.email|

  Scenario Outline: Check for employee startdate get updated successfully if new startdate is valid
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I click on repeater element having repeater "employee in employees"
    Then I click on element having id "bEdit"
    Then I clear input field having <startdate_type> "<startdate_value>"
    And I enter "<Dataset>" into "startdate"input field having <startdate_type> "<startdate_value>"
    Then I assert element having model "<startdate_value>" and has class "<valid_class_name>" should be present
    Then I click on element having buttonText "Update"
    Examples:
    |Dataset|valid_class_name|startdate_type|startdate_value|
    |Testdata10       |ng-valid-pattern|model |selectedEmployee.startDate|

  Scenario Outline: Check for validation error if new start date is invalid
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I click on repeater element having repeater "employee in employees"
    Then I click on element having id "bEdit"
    Then I clear input field having <startdate_type> "<startdate_value>"
    And I enter "<Dataset>" into "startdate"input field having <startdate_type> "<startdate_value>"
    Then I assert element having model "<startdate_value>" and has class "<valid_class_name>" should be present

    Examples:
    |Dataset  |valid_class_name|startdate_type|startdate_value|
    |Testdata11 |ng-invalid-pattern|model |selectedEmployee.startDate|

  Scenario Outline: Check for employee email details get updated successfully if new email is valid
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I click on repeater element having repeater "employee in employees"
    Then I click on element having id "bEdit"
    Then I clear input field having <email_type> "<email_value>"
    And I enter "<Dataset>" into "email"input field having <email_type> "<email_value>"
    Then I assert element having <email_type> "<email_value>" and has class "<valid_class_name>" should be present
    Then I click on element having buttonText "Update"
    Examples:
      |Dataset|email_type|email_value|valid_class_name|
      |Testdata12     |model|selectedEmployee.email|ng-valid-email|

  Scenario Outline: Check for validation failure if employee email details are incorrect during update
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I click on repeater element having repeater "employee in employees"
    Then I click on element having id "bEdit"
    Then I clear input field having <email_type> "<email_value>"
    And I enter "<Dataset>" into "email"input field having <email_type> "<email_value>"
    Then I assert element having <email_type> "<email_value>" and has class "<valid_class_name>" should be present
    Then I click on element having buttonText "Update"
    Examples:
      |Dataset|email_type|email_value|valid_class_name|
      |Testdata13     |model|selectedEmployee.email|ng-invalid-email|

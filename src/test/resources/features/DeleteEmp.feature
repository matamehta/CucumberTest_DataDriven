@Delete
Feature: Delete employee

  Scenario Outline: Check for delete button is disabled in home page
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    Then I take screenshot
    Then I assert element having id "bDelete" and has class "disabled" should be present
  Examples:
    |Dataset|
    |Testdata1       |

  Scenario Outline: Check for delete button gets enabled when employee from list is selected in home page
    Given I am in app loginpage
    And I enter "<Dataset>" into "username"input field having model "user.name"
    And I enter "<Dataset>" into "password"input field having model "user.password"
    When I click on element having buttonText "Login"
    When I click on repeater element having repeater "employee in employees"
    Then element having id "bDelete" should be enabled
  Examples:
   |Dataset|
   |Testdata1       |

  Scenario Outline: Check for validation alert pop if existing employee is selected to delete  ,employee gets deleted from loginpage if alert is accepted
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
    Then I assert repeater element having "employee in employees" should have "emp_full_name" from "<Dataset>" have text present
    Then I click on repeater element having text "employee in employees" should have "emp_full_name" from  "<Dataset>" to be clicked
    Then I take screenshot
    When I click on element having id "bDelete"
    Then I take screenshot
    Then I assert message from alert should be "<alert_message>" and accept alert
    Then I wait for 5 sec
    Then element having xpath"repeater_path" from "<Dataset>"  should not be present


    Examples:
    |Dataset|firstname_type|firstname_value|lastname_type|lastname_value|startdate_type|startdate_value|email_type|email_value|alert_message|
    |Testdata8|model          |selectedEmployee.firstName|model|selectedEmployee.lastName|model |selectedEmployee.startDate|model|selectedEmployee.email|Are you sure you want to delete|

  Scenario Outline: Check for validation alert pop if existing employee is selected to delete  ,employee not deleted from loginpage if alert is dismiss
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
    Then I assert repeater element having "employee in employees" should have "emp_full_name" from "<Dataset>" have text present
    Then I click on repeater element having text "employee in employees" should have "emp_full_name" from  "<Dataset>" to be clicked
    Then I take screenshot
    When I click on element having id "bDelete"
    Then I take screenshot
    Then I assert message from alert should be "<alert_message>" and dismiss alert
    Then I wait for 5 sec
    Then I scroll to bottom of page
    Then element having xpath"repeater_path" from "<Dataset>"  should be present

    Examples:
    |Dataset|firstname_type|firstname_value|lastname_type|lastname_value|startdate_type|startdate_value|email_type|email_value|repeater_path|alert_message|
    |Testdata9 |model          |selectedEmployee.firstName|model|selectedEmployee.lastName|model |selectedEmployee.startDate|model|selectedEmployee.email|.//*[@id='employee-list']/li[contains(text(),'Harrydone walner')]|Are you sure you want to delete|


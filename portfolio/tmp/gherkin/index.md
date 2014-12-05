---
layout: page
comments: true
sharing: false
footer: true
---

## Idea

Generate diagrams from Gherkin (Cucumber features)

Below this line text is fully generated:

## Features
### Cities
![Cities](images/957804b581ac5f3021efbb504caffadd.png)

 - **Searching**

![Searching](images/9554e88f3c8e99d07ab7c8f9e92add28.png)

 - **Adding**

![Adding](images/a8e6ffda5dfb336bb5c3ec86d4a4b6c1.png)

 - **Removing**

![Removing](images/e53de7e5cd517b3bd801b8d2c9baa40c.png)

 - **Ordering**

![Ordering](images/fa84612eb36d5404b9e201291b205999.png)

### Settings screen
![Settings screen](images/38f64f426a90b600085fb326603a18bf.png)

 - **Accessing Settings from app**

![Accessing Settings from app](images/b09335c3ae09c8dd0850477b54dee29a.png)

 - **Changing Temperature units**

![Changing Temperature units](images/45d8fe78d54fbb4658049aee6a649ee1.png)

 - **Entering cities setting screen**

![Entering cities setting screen](images/3f1550ac31cd5824ea9429e4f3ce972e.png)

## UI Elements
*Screens and actions*

![UI Screens and actions](images/1e33f55f77cb49bae2d1da918ed71ff3.png)


## Use cases listing

``` gherkin
Feature: Cities
  In order view weather for different cities,
  As a User,
  I want to have ability to manage cities.

  Scenario: Searching
    Given I am on 'Kiev' city screen
     When I enter cities setting screen
      And I touch Add button
      And I enter 'Amsterdam' in search field
     Then I should see 'Amsterdam' table row

  Scenario: Adding
    Given I am on 'Kiev' city screen
     When I enter cities setting screen
      And I add 'Amsterdam' city
      And I save settings
     Then I should see 'Amsterdam' city screen

  Scenario: Removing
    Given I am on 'Kiev' city screen
     When I enter cities setting screen
     Then I should see 'Kiev' table row
     When I touch Delete on 'Kiev' table row
     Then I should not see 'Kiev' table row
     When I save settings
     Then I should not see 'Kiev' city screen
      And there should not be 'Kiev' city screen

  Scenario: Ordering
    Given there are the existing cities 'Kiev', 'London' and 'Amsterdam'
      And I am on first city screen
     Then I should see 'Kiev' city screen
     When I enter cities setting screen
      And I order cities to 'London', 'Kiev' and 'Amsterdam'
      And I save settings
     Then I should see 'London' city screen
```



``` gherkin
Feature: Settings screen
  In order to change app settings,
  As a User,
  I want to have settings screen.

  Scenario: Accessing Settings from app
    Given I am on any city screen
     Then I should see settings button
     When I touch settings button
     Then I should see settings screen

  Scenario: Changing Temperature units
    Given App 'Temperature scale' defaults is 'C'
      And selected city current temperature is 10
      And I am on Settings screen
     Then I should see 'Temperature scale' label
      And I should see 'C' is selected in 'Temperature scale' segmented control
     When I touch 'F' on "Temperature scale" segmented control
      And I touch 'Done' button
     Then I should see selected city current temperature is 50

  Scenario: Entering cities setting screen
    Given I am on Settings screen
     Then I should see 'Cities' label
     When I touch 'Cities'
     Then I should see 'Cities' screen

```

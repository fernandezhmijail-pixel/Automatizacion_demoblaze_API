Feature: Signup API

  Background:
    * url 'https://api.demoblaze.com'

  Scenario Outline: Crear usuarios
    Given path 'signup'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 200

    * def isSuccess = expectedType == 'success'

    * if (isSuccess) karate.match(response, '#notnull')
    * if (!isSuccess) karate.match(response.errorMessage, expectedMessage)

    Examples:
      | read('classpath:data/signupUsers.json') |


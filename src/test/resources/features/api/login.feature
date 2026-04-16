Feature: Login API

  Background:
    * url 'https://api.demoblaze.com'
    * def jwtPattern = '^[A-Za-z0-9-_]+\\.[A-Za-z0-9-_]+\\.[A-Za-z0-9-_]+$'

  Scenario Outline: Login con distintos usuarios
    Given path 'login'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 200

    * def isToken = expectedType == 'token'

    * if (isToken) karate.match(response.Auth_token, '#regex ' + jwtPattern)
    * if (!isToken) karate.match(response.errorMessage, expectedMessage)

    Examples:
      | read('classpath:data/loginUsers.json') |
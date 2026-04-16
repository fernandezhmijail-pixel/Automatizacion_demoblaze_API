Feature: Login Edge Cases

  Background:
    * url 'https://api.demoblaze.com'
    * def jwtPattern = '^[A-Za-z0-9-_]+\\.[A-Za-z0-9-_]+\\.[A-Za-z0-9-_]+$'

  Scenario Outline: Login edge cases - <testCase>

    Given path 'login'
    And request request

    When method post
    * match responseStatus == expectedStatus

  # Validaciones condicionales
    * eval if (expectedType == 'token') karate.match(response.Auth_token, '#regex ' + jwtPattern)
    * eval if (expectedType == 'error') karate.match(response.errorMessage, '#string')

    Examples:
      | read('classpath:data/loginEdgeCases.json') |
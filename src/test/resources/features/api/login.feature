Feature: Login API

  Background:
    * url 'https://api.demoblaze.com'

  Scenario Outline: Login con usuarios
    Given path 'login'
    And request { username: "<username>", password: "<password>" }
    When method post
    Then status 200

    * if ('<expectedMessage>' == 'Auth_token') karate.match(response.Auth_token, '#notnull')
    * if ('<expectedMessage>' != 'Auth_token') karate.match(response.errorMessage, '<expectedMessage>')

    Examples:
      | username            | password    | expectedMessage       |
      | susan@gmail.com     | Anhhhhh123  | Auth_token            |
      | userwrong@gmail.com | wrongpass   | Wrong password.       |
      | noexiste@mail.com   | cualquier   | User does not exist.  |
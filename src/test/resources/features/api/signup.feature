Feature: Signup API

  Background:
    * url 'https://api.demoblaze.com'

  Scenario Outline: Intentar crear usuarios
    Given path 'signup'
    And request { username: "<username>", password: "<password>" }
    When method post
    Then status 200

    # Validación condicional segura
    * if (<expectedError>) karate.match(response, { errorMessage: "This user already exist." })
    * if (!<expectedError>) karate.log('Usuario creado correctamente: ', response)

    Examples:
      | username           | password       | expectedError |
      | susananr@gmail.com | Elrealista     | false         |
      | susananr@gmail.com | Elrealista     | true          |
      | juan@mail.com      | Pass1234       | false         |


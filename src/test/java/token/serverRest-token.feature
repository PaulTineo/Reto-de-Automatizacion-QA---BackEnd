Feature: Pruebas de Regresion ServerRest

  Background:
    * def schema200 = read('classpath:data/login-schema200.json')

  @happypath
  Scenario: Login de usuario exitoso
    Given url baseUrl + "/login"
    And headers { "Content-Type": "application/json" }
    And request { "email": "#(emailUser)", "password": "#(passwordUser)"}
    When method POST
    Then status 200
    And match response == schema200
    * def token = response.authorization

  @unhappypath
  Scenario: Login de usuario con contraseña incorrecta
    Given url baseUrl + "/login"
    And headers { "Content-Type": "application/json" }
    And request { "email": "#(emailUser)", "password": "wrongPassword"}
    When method POST
    Then status 401
    And match response.message == "Unauthorized"




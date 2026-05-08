Feature: Listar Usuarios del servicio /usuarios

  Background:
    * def headers = read('classpath:header/serverRest-header.json')
    * def authToken = call read('classpath:token/serverRest-token.feature@happypath')
    * def token = authToken.token
    * set headers.Authorization = token
    * def reqRegister = read('classpath:req/registro-usuario.json')
    * def schema200 = read('classpath:data/listar-schema200.json')

  @regresion @happypath @listarUsuarios
  Scenario: Validar el listado de Usuarios exitosamente - Ok
    Given url baseUrl + "/usuarios"
    And headers headers
    When method GET
    Then status 200
    And match response == schema200



Feature: Buscar Usuario por ID del servicio /usuarios/{id}

  Background:
    * def headers = read('classpath:header/serverRest-header.json')
    * def authToken = call read('classpath:token/serverRest-token.feature@happypath')
    * def token = authToken.token
    * set headers.Authorization = token
    * def schema200 = read('classpath:data/buscar-schema200.json')
    * def schema400 = read('classpath:data/buscar-schema400.json')

  @regresion @happypath @buscarUsuario
  Scenario: Validar la busqueda de Usuario exitosamente - OK
    * def responseRegistrar = call read('classpath:payload/serverRest-registrar-payload.feature@registroUsuario')
    * def id = responseRegistrar.idUsuario
    Given url baseUrl + "/usuarios/" + id
    And headers headers
    When method GET
    Then status 200
    And match response == schema200

  @regresion @unhappypath @buscarUsuario
  Scenario: Validar usuario no encontrado en la busqueda de Usuario - NOOK
    Given url baseUrl + "/usuarios/" + '12ilegal22001111'
    And headers headers
    When method GET
    Then status 400
    And match response == schema400
    And match response.message == "Usuário não encontrado"
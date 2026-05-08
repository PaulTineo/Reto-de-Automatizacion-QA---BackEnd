Feature: Modificar Usuario por ID del servicio /usuarios/{id}

  Background:
    * def headers = read('classpath:header/serverRest-header.json')
    * def authToken = call read('classpath:token/serverRest-token.feature@happypath')
    * def token = authToken.token
    * set headers.Authorization = token
    * def reqModificar = read('classpath:req/registro-usuario.json')
    * def schema200 = read('classpath:data/modificar-schema200.json')
    * def schema400 = read('classpath:data/registro-schema400.json')

  @regresion @happypath @modificarUsuario
  Scenario: Validar la modificacion de Usuario exitosamente - OK
    * def responseRegistrar = call read('classpath:payload/serverRest-registrar-payload.feature@registroUsuario')
    * def id = responseRegistrar.idUsuario
    * def email = responseRegistrar.email
    Given url baseUrl + "/usuarios/" + id
    * set reqModificar.nome = "Usuario Modificado"
    * set reqModificar.email = email
    And request reqModificar
    And headers headers
    When method PUT
    Then status 200
    And match response == schema200
    And match response.message == "Registro alterado com sucesso"

  @regresion @unhappypath @modificarUsuario
  Scenario: Validar mensaje de error de Usuario Modificado con un correo en uso - NOOK
    * def responseRegistrar = call read('classpath:payload/serverRest-registrar-payload.feature@registroUsuario')
    * def id = responseRegistrar.idUsuario
    * def email = responseRegistrar.email
    Given url baseUrl + "/usuarios/" + id
    * set reqModificar.nome = "Usuario Modificado"
    * set reqModificar.email = "fulano@qa.com"
    And request reqModificar
    And headers headers
    When method PUT
    Then status 400
    And match response == schema400
    And match response.message == "Este email já está sendo usado"
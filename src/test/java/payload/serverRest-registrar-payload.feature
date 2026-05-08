Feature: Registro de Usuarios del servicio /usuarios

  Background:
    * def headers = read('classpath:header/serverRest-header.json')
    * def authToken = call read('classpath:token/serverRest-token.feature@happypath')
    * def token = authToken.token
    * set headers.Authorization = token
    * def reqRegister = read('classpath:req/registro-usuario.json')
    * def schema201 = read('classpath:data/registro-schema201.json')
  @registroUsuario
  Scenario: Validar el Registro de Usuario exitosamente - OK
    Given url baseUrl + "/usuarios"
    And headers headers
    * set reqRegister.nome = "Usuario Prueba"
    * set reqRegister.email = Java.type('util.UtilClass').generacionemailUnico("Usuario Prueba")
    * set reqRegister.password = "123456"
    * set reqRegister.administrador = "true"
    And request reqRegister
    When method POST
    Then status 201
    And match response == schema201
    * def idUsuario = response._id
    * def email = reqRegister.email

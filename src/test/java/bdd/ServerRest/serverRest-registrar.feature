Feature: Registro de Usuarios del servicio /usuarios

  Background:
    * def headers = read('classpath:header/serverRest-header.json')
    * def authToken = call read('classpath:token/serverRest-token.feature@happypath')
    * def token = authToken.token
    * set headers.Authorization = token
    * def reqRegister = read('classpath:req/registro-usuario.json')
    * def schema201 = read('classpath:data/registro-schema201.json')
    * def schema400 = read('classpath:data/registro-schema400.json')

  @regresion @happypath @registroUsuario
  Scenario Outline: Validar el Registro de Usuario exitosamente - OK
    Given url baseUrl + "/usuarios"
    And headers headers
    * set reqRegister.nome = nome
    * set reqRegister.email = Java.type('util.UtilClass').generacionemailUnico(nome)
    * set reqRegister.password = password
    * set reqRegister.administrador = administrador
    And request reqRegister
    When method POST
    Then status 201
    And match response == schema201
    Examples:
      | read('classpath:data/usuarios-registro.csv') |

  @regresion @unhappypath @registroUsuario
  Scenario: Validar registro de usuario con email en uso - NOOK
    Given url baseUrl + "/usuarios"
    And headers headers
    * set reqRegister.nome = "Usuario Prueba"
    * set reqRegister.email = "fulano@qa.com"
    * set reqRegister.password = "password123"
    * set reqRegister.administrador = "true"
    And request reqRegister
    When method POST
    Then status 400
    And match response.message == "Este email já está sendo usado"
    And match response == schema400
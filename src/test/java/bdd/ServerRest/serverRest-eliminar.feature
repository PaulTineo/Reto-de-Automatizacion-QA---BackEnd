Feature: Elimibar Usuario del servicio /usuarios/{id}

  Background:
    * def headers = read('classpath:header/serverRest-header.json')
    * def authToken = call read('classpath:token/serverRest-token.feature@happypath')
    * def token = authToken.token
    * set headers.Authorization = token
    * def schema200 = read('classpath:data/eliminar-schema200.json')
    * def schema400 = read('classpath:data/eliminar-schema400.json')

  @regresion @happypath @eliminarUsuario
  Scenario: Validar la eliminacion de Usuario exitosamente - OK
    * def responseRegistrar = call read('classpath:payload/serverRest-registrar-payload.feature@registroUsuario')
    * def id = responseRegistrar.idUsuario
    Given url baseUrl + "/usuarios/" + id
    And headers headers
    When method DELETE
    Then status 200
    And match response == schema200
    And match response.message == "Registro excluído com sucesso"

  @regresion @happypath @eliminarUsuario
  Scenario: Validar la eliminacion de Usuario con id inexistente - NOOK
    Given url baseUrl + "/usuarios/" + '12ilegal22001111'
    And headers headers
    When method DELETE
    Then status 200
    And match response == schema200
    And match response.message == "Nenhum registro excluído"

  @regresion @unhappypath @eliminarUsuario
  Scenario: Validar eliminacion de usuario con producto en el carrito - NOOK
    Given url baseUrl + "/usuarios/" + "0uxuPY0cbmQhpEz1"
    And headers headers
    When method DELETE
    Then status 400
    And match response == schema400
    And match response.message == "Não é permitido excluir usuário com carrinho cadastrado"
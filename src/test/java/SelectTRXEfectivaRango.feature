Feature: Consultar transacciones efectivas por rango de fecha HU-98

Background:  
    * def token = read ("classpath:Token/DatosCorrecto/idToken.json")
    * def ApiKey =  read ("classpath:Token/DatosCorrecto/xApiKey.json")

Scenario: 1. Listar transacciones efectivas
    And print token
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator'
    And param status = 'EFECTIVA'
    And param startEffectiveDate = '2023-09-06'
    And param endEffectiveDate = '2023-09-06'
    And header Authorization = token
    And header x-api-key = ApiKey
    And header Accept = '*/*'
    When method GET
    Then status 200    
    And print response

Scenario: 2. No existen transacciones efectivas
    And print token
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator'
    And param status = 'EFECTIVA'
    And param startEffectiveDate = '2023-09-07'
    And param endEffectiveDate = '2023-09-07'
    And header Authorization = token
    And header x-api-key = ApiKey
    And header Accept = '*/*'
    When method GET
    Then status 200    
    And print response

Scenario: 4. Rango de fecha inválido
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator'
    And param status = 'EFECTIVA'
    And param startEffectiveDate = '2023-09-06'
    And param endEffectiveDate = '2023-09-05'
    And header Authorization = token
    And header x-api-key = ApiKey
    And header Accept = '*/*'
    When method GET
    Then status 400    
    And print response

Scenario: 5. Listar sin filtrar por fecha
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator'
    And param status = 'EFECTIVA'
    #And param startEffectiveDate = '2023-09-22'
    #And param endEffectiveDate = '2023-09-22'
    And header Authorization = token
    And header x-api-key = ApiKey
    And header Accept = '*/*'
    When method GET
    Then status 200    
    And print response

Scenario: 6. Error al consultar servicio
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator'
    And param status = 'EFECTIVA'
    And param startEffectiveDate = '2023-09-06'
    And param endEffectiveDate = '2023-09-06'
    And header Authorization = token
    And header Accept = '*/*'
    #And header x-api-key = ApiKey
    When method GET
    Then status 403    
    And print response
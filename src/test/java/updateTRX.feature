Feature: Actualizar TRX  con estado DESCARDATA siempre y cuando tenga estado INCONSISTENTE HU 6


Background:  
    * def token = read ("classpath:Token/DatosCorrecto/idToken.json")
    * def ApiKey =  read ("classpath:Token/DatosCorrecto/xApiKey.json")
    
Scenario: 1. Actualizar TRX INCONSISTENTE con estado DESCARTADA
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator/54ff4b53-b4a9-4351-b47a-15cefd7effc9'
    And def reqBody = {"transactionStatus": "DESCARTADA"}
    And request  reqBody
    And header Authorization = token
    And header x-api-key = ApiKey
    When method PATCH
    Then status 200    
    And print response

Scenario: 2. Actualizar TRX EFECTIVA con estado DESCARTADA
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator/c556e5b2-a2be-4597-92c0-2739078d300'
    And def reqBody = {"transactionStatus": "EFECTIVA"}
    And request  reqBody
    And header Authorization = token
    And header x-api-key = ApiKey
    When method PATCH
    Then status 404    
    And print response

Scenario: 3. Actualizar TRX DESCARTADA con estado DESCARTADA
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator/c556e5b2-a2be-4597-92c0-2739078d300'
    And def reqBody = {"transactionStatus": "EFECTIVA"}
    And request  reqBody
    And header Authorization = token
    And header x-api-key = ApiKey
    When method PATCH
    Then status 404    
    And print response

Scenario: 4. Actualizar TRX sin estado
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator/3b1e81f7-5845-4547-816f-c50ba3b13f7e'
    And def reqBody = {"transactionStatus": ""}
    And request  reqBody
    And header Authorization = token
    And header x-api-key = ApiKey
    When method PATCH
    Then status 400    
    And print response

Scenario: 5. Actualizar TRX no existente 
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator/25655'
    And def reqBody = {"transactionStatus": "DESCARTADA"}
    And request  reqBody
    And header Authorization = token
    And header x-api-key = ApiKey
    When method PATCH
    Then status 404    
    And print response
    
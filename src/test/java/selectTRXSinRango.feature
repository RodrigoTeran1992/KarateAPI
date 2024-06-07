Feature: Consulta de Transacciones HU 7

Background:  
    * def token = read ("classpath:Token/DatosCorrecto/idToken.json")
    * def ApiKey =  read ("classpath:Token/DatosCorrecto/xApiKey.json")
    
Scenario: 1. Consulta TRX con estado INCONSISTENTE y REPETIDA
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator?status=INCONSISTENTE&status=REPETIDA'
    And header Authorization = token
    And header x-api-key = ApiKey
    And header Accept = '*/*'
    When method GET
    Then status 200    
    And print response

    
Scenario: 2. Consulta TRX con estado INCONSISTENTE
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator?status=INCONSISTENTE&status=REPETIDA'
    And header Authorization = token
    And header x-api-key = ApiKey
    And header Accept = '*/*'
    When method GET
    Then status 200    
    And print response

Scenario: 3. Consulta TRX con estado REPETIDA
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator?status=INCONSISTENTE&status=REPETIDA'
    And header Authorization = token
    And header x-api-key = ApiKey
    And header Accept = '*/*'
    When method GET
    Then status 200    
    And print response

Scenario: 4. Consulta TRX con estado EFECTIVA
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator?status=INCONSISTENTE&status=REPETIDA'
    And header Authorization = token
    And header x-api-key = ApiKey
    And header Accept = '*/*'
    When method GET
    Then status 200    
    And print response

Scenario: 5. Consulta TRX con un estado que no existe 
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator?status=INGRESADA'
    And header Authorization = token
    And header x-api-key = ApiKey
    And header Accept = '*/*'
    When method GET
    Then status 400    
    And print response

Scenario: 6. Consulta TRX sin estado 
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator'
    And header Authorization = token
    And header x-api-key = ApiKey
    And header Accept = '*/*'
    When method GET
    Then status 400    
    And print response
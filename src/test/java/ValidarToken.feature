Feature: Consultar APIs de forma segura HU-90

Background:  
    * def reqBodyCorrecto = read ("classpath:Token/DatosCorrecto/request.json")
    * def reqBodyIncorrecto = read ("classpath:Token/DatosIncorrecto/request.json")
    * def reqBodyIncompleto = read ("classpath:Token/DatosIncorrecto/requestIncompleto.json")
    * def tokenExpirado = read ("classpath:Token/DatosIncorrecto/idToken.json")
    * def tokenCorrecto = read ("classpath:Token/DatosCorrecto/idToken.json")
    * def ApiKey =  read ("classpath:Token/DatosCorrecto/xApiKey.json")
    
     
Scenario: 1. Solicitud de token con datos correctos
    Given url 'https://cognito-idp.us-east-1.amazonaws.com/'
    And header Content-Type = 'application/x-amz-json-1.1'
    And header X-Amz-Target = 'AWSCognitoIdentityProviderService.InitiateAuth'
    And header Accept = '*/*'
    And request reqBodyCorrecto
    And print reqBodyCorrecto
    When method POST
    Then status 200
    And print response

Scenario: 2. Solicitud de token con datos incorrectos
    Given url 'https://cognito-idp.us-east-1.amazonaws.com/'
    And header Content-Type = 'application/x-amz-json-1.1'
    And header X-Amz-Target = 'AWSCognitoIdentityProviderService.InitiateAuth'
    And header Accept = '*/*'
    And request reqBodyIncorrecto
    And print reqBodyIncorrecto
    When method POST
    Then status 400
    And print response

Scenario: 3. Solicitud de token con datos faltantes
    Given url 'https://cognito-idp.us-east-1.amazonaws.com/'
    And header Content-Type = 'application/x-amz-json-1.1'
    And header X-Amz-Target = 'AWSCognitoIdentityProviderService.InitiateAuth'
    And header Accept = '*/*' 
    And request reqBodyIncompleto
    And print reqBodyIncompleto
    When method POST
    Then status 400
    And print response

Scenario: 4. Consulta de API sin token
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator?status=INCONSISTENTE&status=REPETIDA'
    And header Authorization = ''
    And header x-api-key = ApiKey
    And header Accept = '*/*' 
    When method GET
    Then status 401    
    And print response

Scenario: 5. Consulta de API con token inválido / expirado
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator?status=INCONSISTENTE&status=REPETIDA'
    And header Authorization = tokenExpirado
    And header x-api-key = ApiKey
    And header Accept = '*/*' 
    When method GET
    Then status 401    
    And print response

Scenario: 6. Consulta de API sin apikey
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator?status=INCONSISTENTE&status=REPETIDA'
    And header Authorization = tokenCorrecto
    And header x-api-key = ''
    And header Accept = '*/*'
    When method GET
    Then status 403    
    And print response

Scenario: 7. Consulta de API con apikey incorrecto
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator?status=INCONSISTENTE&status=REPETIDA'
    And header Authorization =  tokenCorrecto
    And header x-api-key = '5255f'
    And header Accept = '*/*'
    When method GET
    Then status 403    
    And print response

    
Scenario: 8. Consulta de API con token válido y apikey correcto
    Given url 'https://7tmni6kk16.execute-api.us-east-1.amazonaws.com/dev/api/v1/transactionsAggregator?status=EFECTIVA'
    And header Authorization =  tokenCorrecto
    And header x-api-key = ApiKey
    And header Accept = '*/*'
    When method GET
    Then status 200    
    And print response
Feature: plan de pruebas


  Scenario: Usuario y password incorrecto en login
    Given url 'http://181.39.77.178:51571/v1/FAC5C58B-2FBC-4926-8ACC-468F0AD3776D'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field Service = '5CD9FDAA-E77E-4EEE-A6AF-63CAF90CAA6D'
    And form field identificacion = '1002700969001'
    And headers Authorization = '0D743317-C62B-4880-940F-01D122C69FD5'
    When method post







##  PHP SDK

PHP SDK has been tested to work with php version 5.6.35 or later.

### Ensuring TLS 1.2-Only Compatibility

If you would like to test compatibility with the LIVE TLS 1.2-only environment, assign `$platform = 'tls12-api'`, instead of `'api'` in `'src/Beanstream/Configuration.php'`.

This will point your requests to the endpoint `'tls12-api.na.bambora.com'`. 

Please be advised that this endpoint is provided for a limited time, and is intended for integration compatibility testing only, and is not intended for any type of load tests. 

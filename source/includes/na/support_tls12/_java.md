##  Java SDK

Java v1.8 support TLS 1.2 by default, you do not need to make any changes.

### Test TLS 1.2 

To test your integration against TLS 1.2 only server, change BaseUrl in:

'/src/main/java/com/beanstream/connection/BeanstreamUrls.java', line 33:

From:

public static final String BaseUrl = "https://{0}.beanstream.com/api";

To:

public static final String BaseUrl = "https://tls12-api.na.bambora.com";


  

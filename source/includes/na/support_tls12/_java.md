##  Java SDK

You will need Java v1.8 or later to connect to TLS 1.2 only server. 

Latest publicly available version of Java v1.7 (update 80) doesn't support TLS 1.2 so unless you have commercial support from Oracle, you will need to update to Java v1.8.

If you are already using Java v1.8 you don't need to change anything.


### Test TLS 1.2 

To test your integration against TLS 1.2 only server, change BaseUrl in:

'/src/main/java/com/beanstream/connection/BeanstreamUrls.java', line 33:


From:

```Java
public static final String BaseUrl = "https://{0}.beanstream.com/api";
```

To:

```Java
public static final String BaseUrl = "https://tls12-api.na.bambora.com";
```
  

##  Java SDK

You will need Java v1.7 build 79 or later to connect to TLS 1.2 only server. If you are using any previous version of Java, you will need to upgrade to version which supports TLS 1.2.

In Java 1.7 as of build 79, TLS 1.2 support was made available, just not by default. It was only made default later on in Oracle Java 1.7 131 or Java 1.8.

If you are using Java 1.7 build 79 up to build 130, you will need to add following code in order to use TLS 1.2:

```Java
  ...
  SSLContext sslContext = SSLContexts.custom().useTLS().build();
  SSLConnectionSocketFactory f = new SSLConnectionSocketFactory(sslContext,
                new String[]{"TLSv1.2"},
                null,
                SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
  httpclient = HttpClients.custom()
                .setSSLSocketFactory(f)
                .build();
  
  Gateway beanstream = new Gateway("v1", 300200578,
                "4BaD82D9197b4cc4b70a221911eE9f70");
  beanstream.setCustomHttpsClient(httpclient);
  ...
```

If you are already using Java 1.7 131 or Java 1.8 you do not need to make any changes.


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
  

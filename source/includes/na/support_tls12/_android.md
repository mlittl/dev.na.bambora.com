##  Android SDK

To test Android SDK with TLS 1.2 only server, you need to change following in '/checkout/src/main/java/com/bambora/na/checkout/services/TokenService.java', line 33:

From:

```Java
    private final static String URL_TOKENIZATION = "https://api.na.bambora.com/scripts/tokenization/tokens";
```

To:

```Java
    private final static String URL_TOKENIZATION = "https://tls12-api.na.bambora.com/scripts/tokenization/tokens";
```

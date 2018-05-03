##  Java SDK

### Test TLS 1.2 

To test your integration against TLS 1.2 only server, change BaseUrl in:

'/src/main/java/com/beanstream/connection/BeanstreamUrls.java', line 33:

From:
public static final String BaseUrl = "https://{0}.beanstream.com/api";

To:
public static final String BaseUrl = "https://tls12-api.na.bambora.com";


```c#

...

Gateway bambora = new Gateway()
            {
                MerchantId = 300200578,
                PaymentsApiKey = "4BaD82D9197b4cc4b70a221911eE9f70",
                ApiVersion = "1"
            };
...

```    

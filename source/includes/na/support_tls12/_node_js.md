##  NodeJS SDK

To point library to TLS 1.2 only server, in '/lib/beanstream.js' file, change line 4:

From:

```
Beanstream.DEFAULT_HOST = "https://www.beanstream.com/api/";
```
To:
```
Beanstream.DEFAULT_HOST = "https://tls12-api.na.bambora.com/";

```

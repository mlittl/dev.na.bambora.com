##  Python SDK

You will need Python 3.0 or later to connect to TLS 1.2 only server.

### Test TLS 1.2 

To point library to TLS 1.2 only server, change the following lines:

#### 1. In '/beanstream/gateway.py' file, change:

From:

```python
connection = HTTPSConnection('www.beanstream.com')
```
To:

```python
connection = HTTPSConnection('tls12-api.na.bambora.com')
```

#### 2. In '/beanstream/transaction.py' file, change:

From:

```python
connection = HTTPSConnection('www.beanstream.com')
```
To:

```python
connection = HTTPSConnection('tls12-api.na.bambora.com')
```

In addition, you will need to change:

From:

```python
log.debug('Sending to ', 'https://www.beanstream.com'+self.url, data)
request = Request('https://www.beanstream.com'+self.url)
```
To:

```python
log.debug('Sending to ', 'https://tls12-api.na.bambora.com'+self.url, data)
request = Request('https://tls12-api.na.bambora.com'+self.url)
```
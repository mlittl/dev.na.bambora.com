## Voids

```shell
Definition
POST /v1/payments HTTP/1.1

Request
curl https://api.na.bambora.com/v1/payments/{transId}/void
-H "Authorization: Passcode MzAwMjAwNTc4OjRCYU..."
-H "Content-Type: application/json"
-d '{
    "amount":14.30
}'
```

```php
$result = $beanstream->payments()->voidPayment($transaction_id, 12.99);
```

```python
resp = beanstream.void_purchase(transaction_id, 12.99)

''' OR for voiding returns: '''
resp = beanstream.void_return(transaction_id, 12.99)
```

```java
PaymentResponse response = beanstream.payments().voidPayment(transactionId, 70.00);
```

```csharp
PaymentResponse response = bambora.Payments.Void (response.TransactionId, 30);
```

A Void will cancel a transaction before it is registered against a customer’s credit card account. Cardholders will never see a voided transaction on their credit card statement. As a result voids can only be attempted on the same day as the original transaction. After the end of day (roughly 11:59 PM EST/EDT), void requests will be rejected from the API if attempted. From that point on, for that transaction, you will need to perform a Return.

You can Void purchases and returns and you must supply the amount to void. This amount must equal the amount of that transaction, no more or less.


## Returns

```shell
Definition
POST /v1/payments HTTP/1.1

Request
curl https://api.na.bambora.com/v1/payments/{transId}/returns
-H "Authorization: Passcode MzAwMjAwNTc4OjRCYU..."
-H "Content-Type: application/json"
-d '{
    "amount":12.50
}'
```

```php
$result = $beanstream->payments()->returnPayment($transaction_id, 12.99, $order_number);
```

```python
resp = beanstream.return_purchase(transaction_id, 12.99)
```

```java
PaymentResponse response = beanstream.payments().returnPayment(transactionId, 70.00);
```

```csharp
PaymentResponse response = bambora.Payments.Return (response.TransactionId, 40.0);
```

### Unreferenced Returns

```shell
Definition
POST /v1/payments/0/returns HTTP/1.1

curl https://api.na.bambora.com/v1/payments/0/returns
-H "Authorization: Passcode MzAwMjAwNTc4OjRCYU..."
-d '{
   "merchant_id":280001000,
   "order_number":"10000123",
   "amount":500.00,
   "payment_method":"card",
   "card":{
      "name":"John Doe",
      "number":"5100000010001004",
      "expiry_month":"02",
      "expiry_year":"14",
      "cvd":"642"
   }
}'
```

```php
<?php

$req = curl_init('https://api.na.bambora.com/v1/payments/0/returns');

$headers = array(
	'Content-Type:application/json',
	'Authorization: Basic dXNlcm5hbWU6cGFzc3dvcmQ='
);

curl_setopt($req,CURLOPT_HTTPHEADER, $headers);
curl_setopt($req,CURLOPT_RETURNTRANSFER, 1);
curl_setopt($req,CURLOPT_HEADER, 0);

$post = array(
	'merchant_id' => 280001000,
	'order_number' => '10000123',
	'amount' => 500.00,
	'payment_method' => 'card',
	'card' => array(
		'name' => 'John Doe',
		'number' => '5100000010001004',
		'expiry_month' => '02',
		'expiry_year' => '14',
		'cvd' => '642'
	)
);   

curl_setopt($req,CURLOPT_POST, 1);
curl_setopt($req,CURLOPT_POSTFIELDS, json_encode($post));

$res_json = curl_exec($req);
$res = json_decode($res_json);

curl_close($req);

print_r($res);

?>
```

```python
from urllib2 import Request, urlopen, HTTPError
import json

req_body = json.dumps({
    'merchant_id': 280001000,
    'order_number': '10000123',
    'amount': 500.00,
    'payment_method': 'card',
    'card': {
        'name': 'John Doe',
        'number': '5100000010001004',
        'expiry_month': '02',
        'expiry_year': '14',
        'cvd': '642'
    }
})

req = Request(
    'https://api.na.bambora.com/v1/payments/0/returns',
    data=req_body,
    headers={
        'Content-Type': 'application/json',
        'Authorization': 'Basic dXNlcm5hbWU6cGFzc3dvcmQ='
    })

try:
    # HTTP Request success
    response = json.loads(urlopen(req).read())
    print(response)
except HTTPError, e:
    # Handle errors here
    error = json.loads(e.read())
    print(error)
```

```java

```

```csharp

```

A Return will refund the customer part or all of the money from a transaction.

In order to perform a Return you must know the transaction ID from the purchase. This is returned in the response to the transaction.

You can return all or some of the original purchase amount.

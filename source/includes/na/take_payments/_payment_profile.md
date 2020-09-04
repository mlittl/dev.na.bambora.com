
## Payment Profile

```shell
Definition
POST /v1/payments HTTP/1.1

Request
curl https://api.na.bambora.com/v1/payments
-H "Authorization: Passcode MzAwMjAwNTc4OjRCYU..."
-H "Content-Type: application/json"
-d '{
    "payment_method":"payment_profile",
    "order_number":"UPDQWX1429722203",
    "amount":12.99,
    "payment_profile":{
        "customer_code":"053EF0CFD9b847dE8115ED21C2b1e7df",
        "card_id":1,
        "complete":true
    }
}'
```

```php
$beanstream = new \Beanstream\Gateway('300200578', '4BaD82D9197b4cc4b70a221911eE9f70', 'www', 'v1');

$profile_payment_data = array(
    'order_number' => "abc123",
    'amount' => 75.50
);
try {
    $result = $beanstream->payments()->makeProfilePayment($profile_id, 1, $profile_payment_data, TRUE); //set to FALSE for Pre-Auth
    print_r( $result );
} catch (\Beanstream\Exception $e) {
    //handle exception
}
```

```python
beanstream = gateway.Beanstream()
beanstream.configure(
    '300200578',
    payment_passcode='4BaD82D9197b4cc4b70a221911eE9f70')
trans = beanstream.purchase_with_payment_profile(50.43, profile_id)
resp = trans.commit()
```

```java
Gateway beanstream = new Gateway("v1",
    300200578,
    "4BaD82D9197b4cc4b70a221911eE9f70");

ProfilePaymentRequest req = new ProfilePaymentRequest();
req.setProfile(new ProfilePaymentRequestData()
    .setCardId(1)
    .setCustomerCode(profile.getId()));
req.setAmount(13);
req.setOrderNumber("myOrderId00002");

try {
    PaymentResponse response = beanstream.payments().makePayment(req);
    System.out.println("Card Payment Approved? "+ response.isApproved());

} catch (BeanstreamApiException ex) {
    // todo handle error
}
```

```csharp
Gateway bambora = new Gateway () {
    MerchantId = 300200578,
    PaymentsApiKey = "4BaD82D9197b4cc4b70a221911eE9f70",
    ApiVersion = "1"
};

PaymentResponse payment = bambora.Payments.MakePayment (new ProfilePaymentRequest() {
    Amount = 40.95,
    OrderNumber = "myOrder002233",
    PaymentProfile = new PaymentProfileField() {
        CardId = 1,
        CustomerCode = profile_id
    }
});
```

Payment Profiles provide a secure method of taking payments that reduces your PCI scope. You can take a payment using a token the same as you would take a payment with a credit card, the main difference being you have to supply the Profile’s customer_code.

Before processing a transaction using a 'Payment Profile', you need to have created a one. See [here](/docs/references/payment_SDKs/save_customer_data).

A multi-use payment profile token is distinct from a single-use card token. See [here](/docs/references/payment_SDKs/save_customer_data).

### Pre-Auth and Complete

```shell
Definition
POST /v1/payments HTTP/1.1

Request
curl https://api.na.bambora.com/v1/payments
-H "Authorization: Passcode MzAwMjAwNTc4OjRCYU..."
-H "Content-Type: application/json"
-d '{
    "payment_method":"payment_profile",
    "order_number":"UPDQWX1429722203",
    "amount":12.99,
    "payment_profile":{
        "customer_code":"053EF0CFD9b847dE8115ED21C2b1e7df",
        "card_id":1,
        "complete":false
    }
}'

#
# completion:
#

Definition
POST /v1/payments HTTP/1.1

Request
curl https://api.na.bambora.com/v1/payments/{transId}/completions
-H "Authorization: Passcode MzAwMjAwNTc4OjRCYU..."
-H "Content-Type: application/json"
-d '{
    "amount":9.20
}'
```

```php
$beanstream = new \Beanstream\Gateway('300200578', '4BaD82D9197b4cc4b70a221911eE9f70', 'www', 'v1');

$profile_payment_data = array(
    'order_number' => "abc123",
    'amount' => 75.50
);
try {
    $result = $beanstream->payments()->makeProfilePayment($profile_id, 1, $profile_payment_data, FALSE); // FALSE for Pre-Auth
    $transaction_id = $result['id'];
    // complete payment
    $result = $beanstream->payments()->complete($transaction_id, 12.5);
    print_r( $result );
} catch (\Beanstream\Exception $e) {
    //todo handle exception
}
```

```python
txn = beanstream.preauth_profile(60, customer_code)
resp = txn.commit()
trans = beanstream.preauth_completion(resp.transaction_id(), 25.00)
```

```java
Gateway beanstream = new Gateway("v1",
    300200578,
    "4BaD82D9197b4cc4b70a221911eE9f70");

ProfilePaymentRequest req = new ProfilePaymentRequest();
req.setProfile(new ProfilePaymentRequestData()
    .setCardId(1)
    .setCustomerCode(profile.getId()));
req.setAmount(130);
req.setOrderNumber("myOrderId00002");

try {
    PaymentResponse result = beanstream.payments().preAuth(paymentRequest);

    // complete the pre-auth
    result = beanstream.payments().preAuthCompletion(result.id, 100, null);

} catch (BeanstreamApiException ex) {
    // todo handle error
}
```

```csharp
Gateway bambora = new Gateway () {
    MerchantId = 300200578,
    PaymentsApiKey = "4BaD82D9197b4cc4b70a221911eE9f70",
    ApiVersion = "1"
};
// pre-auth
PaymentResponse payment = bambora.Payments.PreAuth (new ProfilePaymentRequest() {
    Amount = 50,
    OrderNumber = "myFancyOrderID-1234",
    PaymentProfile = new PaymentProfileField() {
        CardId = 1,
        CustomerCode = response.Id
    }
});
// complete payment
payment = bambora.Payments.PreAuthCompletion (payment.TransactionId, 15.12);
```

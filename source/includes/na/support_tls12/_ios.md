##  iOS SDK

To test iOS SDK with TLS 1.2 only server, you need to change following in 
'/Checkout/Classes/ProcessingViewController.swift', line 60:

From:

```swift
        if let url = URL(string: "https://api.na.bambora.com/scripts/tokenization/tokens") {
```

To:

```swift
        if let url = URL(string: "https://tls12-api.na.bambora.com/scripts/tokenization/tokens") {
```

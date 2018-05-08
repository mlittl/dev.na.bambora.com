---
title: Support for TLS 1.2
layout: tutorial

summary: Details on testing and supporting TLS 1.2 with our SDKs.

navigation:
  header: na.tocs.na_nav_header
  footer: na.tocs.na_nav_footer
  toc: na.tocs.payment_sdks
  header_active: References

includes:
- na/support_tls12/node_js
- na/support_tls12/php
- na/support_tls12/ruby
- na/support_tls12/python
- na/support_tls12/java
- na/support_tls12/dotnet
- na/support_tls12/go
- na/support_tls12/android
- na/support_tls12/ios
- na/support_tls12/browser

---

# SDK Support for TLS 1.2

### System requirements for Ruby, Python and Node on Linux and Mac OS (OS X):

* OpenSSL (or LibreSSL) >= 1.0.1

Operating systems that provide support for OpenSSL >= 1.0.1:

* Ubuntu 12.04 (Precise) or later
* RedHat Enterprise Linux 6 / CentOS 6 or later
* Debian 7 (Wheezy) or later
* Mac OS X 10.9 (Mavericks) or later

You can confirm the version of OpenSSL installed by running "openssl version" from the command line.  Note: The command may output either “OpenSSL” or “LibreSSL”.

## SDK testing with TLS 1.2 only server

URL for TLS 1.2 only server is https://tls12-api.na.bambora.com

Follow instructions below for SDK you are using to test your integration against TLS 1.2 only server.


##  Ruby SDK

To test Ruby SDK with TLS 1.2 only server, you need to change following in '/lib/beanstream.rb', lines 10 - 31:

From:

```Ruby
  @url_prefix = "www"
  @url_suffix = "api"
  @url_base = "beanstream.com"
  @url_version = "v1"
  @ssl_ca_cert = File.dirname(__FILE__) + '/resources/cacert.pem'
  @timeout = 80
  @open_timeout = 40
  
  class << self
    attr_accessor :merchant_id, :payments_api_key, :profiles_api_key, :reporting_api_key
    attr_accessor :url_prefix, :url_base, :url_suffix, :url_version
    attr_accessor :url_payments, :url_return, :url_void
    attr_accessor :ssl_ca_cert, :timeout, :open_timeout
  end
  
  def self.api_host_url()
    "https://#{@url_prefix}.#{url_base}"
  end
  
  def self.api_base_url()
    "/#{url_suffix}/#{url_version}"
  end  
```

To:

```Ruby
  @url_prefix = ""
  @url_suffix = ""
  @url_base = "tls12-api.na.bambora.com"
  @url_version = "v1"
  @ssl_ca_cert = File.dirname(__FILE__) + '/resources/cacert.pem'
  @timeout = 80
  @open_timeout = 40
  
  class << self
    attr_accessor :merchant_id, :payments_api_key, :profiles_api_key, :reporting_api_key
    attr_accessor :url_prefix, :url_base, :url_suffix, :url_version
    attr_accessor :url_payments, :url_return, :url_void
    attr_accessor :ssl_ca_cert, :timeout, :open_timeout
  end
  
  def self.api_host_url()
    "https://#{url_base}"
  end
  
  def self.api_base_url()
    "/#{url_version}"
  end
```

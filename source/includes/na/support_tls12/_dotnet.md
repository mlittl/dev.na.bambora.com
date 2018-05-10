##  C# SDK

Bambora.NA.SDK package is available for .NET 4.5 or later and for .NET Standard 2.0

Nuget package is available from [here](https://www.nuget.org/packages/Bambora.NA.SDK/)

Souce code can be downloaded from [github](https://github.com/bambora-na/bambora-na-dotnet)

Our github repository has simple application to get you started.

### Test TLS 1.2 

To test your integration against TLS 1.2 only server, add following line in your code before instantiating Bambora gateway object

```c#

//By default, BaseUrl is set to https://api.na.bambora.com. 
//To test your code against TLS 1.2 only server, change it as in line below
Bambora.NA.SDK.BamboraUrls.BaseUrl = "https://tls12-api.na.bambora.com";

...

Gateway bambora = new Gateway()
            {
                MerchantId = 300200578,
                PaymentsApiKey = "4BaD82D9197b4cc4b70a221911eE9f70",
                ApiVersion = "1"
            };
...

```            

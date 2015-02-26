# LomadeeApi

A Ruby client for the official Lomadee API.

## Installation

Add this line to your application's Gemfile:

    gem 'lomadee_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lomadee_api

## Configuration

To start using the gem, you can instantiate a new Base object from LomadeeApi module with three configuration options (application_id, sandbox and country)

```ruby
lomadee = LomadeeApi::Base.new(application_id: 'YOUR_APPLICATION_ID', sandbox: true)
```

The following table shows which options are accepted and its default values.

| Options | Values |
|----------------|-----------------------------------------------------------------------------------------------------------------------------|
| application_id | Encrypted ID that is generated when you create a lomadee application |
| country | "BR" (Brazil), "AR" (Argentina), "CO" (Colombia), "CL" (Chile), "MX" (Mexico), "PE" (Peru), "VE" (Venezuela), default: "BR" |
| sandbox | true/false, default: false |

## Usage Examples

After configuring a lomadee object, you can do the following things.

### Get all products from a given category id

```ruby
lomadee = LomadeeApi::Base.new(application_id: 'YOUR_APPLICATION_ID')
category_products = []

lomadee.products(77) do |products|
    products.each do |product|
        category_products << product['product']
    end
end

puts category_products.count
```

### Get all offers from a given product id

```ruby
lomadee = LomadeeApi::Base.new(application_id: 'YOUR_APPLICATION_ID')
product_offers = []

lomadee.offers(572767) do |offers|
    offers.each do |offer|
        product_offers << offer['offer']
    end
end

puts product_offers.count
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/lomadee_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
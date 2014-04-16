# YaDirectApi

Simple gem for Yandex Direct Api using with ruby

## Installation

Add this line to your application's Gemfile:

    gem 'ya_direct_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ya_direct_api

## Usage

```
@api = Ya::Direct::Api.new('token', 'app_id', 'login', 'ru')
json = @api.get_campaigns_list
```

## Contributing

1. Fork it ( http://github.com/AndreySavelyev/ya_direct_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

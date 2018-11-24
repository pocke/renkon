# Renkon

Reckon is a `Range` generator with `Comparable`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'renkon'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install renkon

## Usage

```ruby
require 'renkon'
using Renkon::Patch

renkon = 10 <= Renkon.x <= 100
p renkon.to_range == (10..100) # => true

case 20
when 10 <= Renkon.x < 20
  # unreachable
when 20 <= Renkon.x < 30
  puts 'It executes here!'
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pocke/renkon.

License
-------

These codes are licensed under CC0.

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.en)

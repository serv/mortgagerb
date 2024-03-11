# Mortgagerb

Calculates monthly payment for various types of mortgage. To learn more about how the calculations are done, see [amortizing loan](https://en.wikipedia.org/wiki/Amortizing_loan).

Currently supported loan types

- 30 year fixed
- Others coming soon

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add mortgagerb 

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install mortgagerb

## Usage

```ruby
require 'mortgagerb'

rate = 5.5
principal = 1000000
type = :thirty_year_fixed 

scenario = Mortgagerb::Scenario.new(principal, rate, type)
amortization_payment = scenario.calculate # 5677.89
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/serv/mortgagerb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

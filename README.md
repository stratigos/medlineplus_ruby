# medlineplus_ruby

[![Gem Version](https://badge.fury.io/rb/medlineplus_ruby.svg)](https://badge.fury.io/rb/medlineplus_ruby)

:construction: *Under Development*

:gem: This Rubygem facilitates retrieval of data from the National Libray of Medicine's Medlineplus Connect API. The NLM API is non intuitive to work with. This gem provides an easier to use interface, and parses the responses to a more meaningful hash for the modern Ruby developer.

## Installation

:thumbsup: Add this line to your application's Gemfile:

```ruby
gem 'medlineplus_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install medlineplus_ruby

## Usage

:running: Currently there is one feature, retrieving a set of descriptions associated with an ICD-10 diagnosis code. This can be demonstrated through the `pry` REPL, via the `./bin/console` script in the gem root dir:

```ruby
client       = MedlineplusRuby::Client.new
descriptions = client.description_data_for_code 'J01.01'
```

:dizzy: Example usage can also be found in the wrapper application, [Medlineplus Connect Demo](https://github.com/stratigos/medline_plus_connect_demo), which is currently [hosted on Heroku](https://toddsmedlinedemo.herokuapp.com).

## Tests

:guardsman: Download the gem locally, and run `rspec spec` to run the test suite.

## Development

:neutral_face: After checking out the repo, run `bin/setup` to install dependencies. You can
also run `bin/console` for an interactive prompt that will allow you to experiment.

:computer: To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the
version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

:trollface: Bug reports and PRs from forks are welcome on GitHub at https://github.com/stratigos/medlineplus_ruby.

## License

:cop: The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

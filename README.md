# Encyclopedia of Life API Wrapper

## Description

A wrapper for the Encyclopedia of Life API.  It provides simple methods to call all of the available EOL API endpoints.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'eol'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eol

## Examples

#### Search for some orchids
```ruby
# create a search
search = Eol.search("tolumnia")

# decide to modify the search
search = Eol.search("tolumnia", exact: true)

# print links to your results
search.each do |search|
  puts search.link
end
```
#### Make requests with or without options
```ruby
# get collections
collections = Eol.collections("176")

# get sorted and cached collections
collections = Eol.collections('176', sort_by: 'oldest', cache_ttl: 30)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/itroman/eol. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


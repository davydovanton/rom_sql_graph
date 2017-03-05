# RomSqlGraph

Rom-rb and hanami tool for generating db (sql) association graph.

**For generating image you need to install graphviz tool (http://www.graphviz.org)**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rom_sql_graph'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rom_sql_graph

## Usage

```ruby
# First: create rom repository object
repo = UserRepository.new

# Second: create Rom::Sql::Graph object
graph = RomSqlGraph.generate(repo)

# Generate image or html file with your db associations
graph.generate_image
graph.generate_html

# convert graph to any type
graph.to_a
graph.to_s
graph.to_json
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rom_sql_graph. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


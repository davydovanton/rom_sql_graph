# RomSqlGraph

[Rom-rb](http://rom-rb.org) and [hanami](http://hanamirb.org) tool for generating db (sql) association graph.

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

### Image example
![ossboard-graph](https://github.com/davydovanton/rom_sql_graph/blob/master/graph.jpg?raw=true)


## TODO:
- [ ] add tests
- [x] generate html
- [ ] generate json

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rom_sql_graph. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


# Collection Cache Keys for ActiveRecord 3.0 - 4.2

[![Code Climate](https://codeclimate.com/repos/56f021bcc7befb007e002f24/badges/ddbc25f40952bed70d65/gpa.svg)](https://codeclimate.com/repos/56f021bcc7befb007e002f24/feed)

This gem is a backport of Rails 5's `Model.collection_cache_key` feature,
allowing smarter, deterministic caching of ActiveRecord relations.

## Installation

Add `activerecord-collection_cache_key` to your `Gemfile`:

```ruby
gem 'activerecord-collection_cache_key'
```

## Usage

You can access the key for the default scope of an AR model by calling the bare method:

```ruby
@key = MyModel.collection_cache_key
```

Or the key for a specific query:

```ruby
@scope = MyModel.where(active: 1).order('updated_at DESC')
@key = MyModel.collection_cache_key(@scope)
```

And then use it in your view:

```erb
<% cache @key do %>
  <% # some code that renders your collection %>
<% end %>
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for details

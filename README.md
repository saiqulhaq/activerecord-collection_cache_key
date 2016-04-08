# Collection Cache Keys for ActiveRecord 3.0 - 4.2

[![Code Climate](https://codeclimate.com/repos/56f050f5493ebb008500b6a9/badges/bd915cce171c63066ca3/gpa.svg)](https://codeclimate.com/repos/56f050f5493ebb008500b6a9/feed) [![Build Status](https://travis-ci.org/customink/activerecord-collection_cache_key.svg?branch=master)](https://travis-ci.org/customink/activerecord-collection_cache_key)

This gem is a backport of Rails 5's [`Relation#cache_key` feature](https://github.com/rails/rails/pull/20884),
allowing smarter, deterministic caching of ActiveRecord relations.

## Installation

Add `activerecord-collection_cache_key` to your `Gemfile`:

```ruby
gem 'activerecord-collection_cache_key'
```

## Usage

You can now access the key for any ActiveRecord collection via its `#cache_key` method:

```ruby
@scope = MyModel.where(active: 1).cache_key
```

And then use it in your controller:

```ruby
def index
  @scope = MyModel.where(active: 1)
  Rails.cache.fetch(@scope.cache_key) do
    respond_with(@scope)
  end
end
```

**Notes on Rails 3.x and `.all`:**

In some versions of Rails covered by this gem, `Model.all` returns an array, and not an instance
of `ActiveRecord::Relation`. In these cases it's possible to access the default key via class method on the model:

```ruby
MyModel.collection_cache_key
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for details

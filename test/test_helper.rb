require 'bundler'
Bundler.require :development, :test

require 'active_support'
require 'active_support/core_ext/string'
require 'active_support/deprecation'
require 'activerecord-collection_cache_key'
require 'minitest/autorun'
require 'logger'

ActiveRecord::Base.logger = Logger.new('/dev/null')
ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'
ActiveSupport::Deprecation.silenced = true

module CollectionCacheKey
  class TestCase < MiniTest::Spec
    before { setup_schema }

    def ar_nsec?
      !::ActiveRecord::VERSION::STRING.start_with? '3.2.'
    end

    private

    def setup_schema
      ::ActiveRecord::Base.class_eval do
        connection.instance_eval do
          create_table :test_models, force: true do |t|
            t.text :name
            t.text :notes
            t.timestamps
          end
        end
      end
    end

    class TestModel < ::ActiveRecord::Base
    end
  end
end

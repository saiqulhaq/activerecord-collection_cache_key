$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'collection_cache_key/version'

Gem::Specification.new do |spec|
  spec.name          = 'activerecord-collection_cache_key'
  spec.version       = CollectionCacheKey.version_string
  spec.authors       = ['Dan Drinkard']
  spec.email         = %w(dan.drinkard@customink.com)
  spec.summary       = 'Rails-5-style ActiveRecord::Relation cache keys for everyone.'
  spec.description   = 'Make ActiveRecord queries cacheable throughout your apps!'
  spec.homepage      = 'http://github.com/customink/activerecord-collection_cache_key'
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = %w(lib)
  spec.add_runtime_dependency     'activerecord', '>= 3.0', '< 5.0'
  spec.add_development_dependency 'activesupport', '>= 3.0', '< 5.0'
  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'sqlite3'
end

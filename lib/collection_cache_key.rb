require 'active_record'
require 'collection_cache_key/active_record'
require 'collection_cache_key/cache_key'
require 'collection_cache_key/relation'
require 'collection_cache_key/version'

ActiveRecord::Base.extend CollectionCacheKey::CacheKey
ActiveRecord::Relation.include CollectionCacheKey::Relation

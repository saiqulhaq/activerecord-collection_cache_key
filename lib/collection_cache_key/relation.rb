module CollectionCacheKey
  module Relation
    def cache_key(timestamp_column = :updated_at)
      @cache_keys ||= {}
      @cache_keys[timestamp_column] ||= @klass.collection_cache_key(self, timestamp_column)
    end
  end
end

module CollectionCacheKey
  module ActiveRecord
    def self.stores_local_time?
      ::ActiveRecord::VERSION::STRING.start_with? '3.'
    end
  end
end

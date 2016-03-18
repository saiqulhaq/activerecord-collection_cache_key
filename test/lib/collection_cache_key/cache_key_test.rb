require 'test_helper'

module CollectionCacheKey
  class CacheKeyTest < TestCase
    subject { TestModel }
    let(:cache_namespace) { subject.to_s.underscore.pluralize }
    let(:original_time) { Time.parse('2010-01-01T00:00:00Z').utc }
    let(:original_time_str) do
      ar_nsec? ? '20100101000000000000000' : '20100101000000'
    end
    let(:update_time) { Time.parse('2020-01-01T00:00:00Z').utc }
    let(:update_time_str) do
      ar_nsec? ? '20200101000000000000000' : '20200101000000'
    end

    # rubocop:disable LineLength
    let(:default_sql) { %(SELECT "#{subject.table_name}".* FROM "#{subject.table_name}" WHERE (1 = 1)) }
    let(:filtered_sql) { %(SELECT "#{subject.table_name}".* FROM "#{subject.table_name}" WHERE "#{subject.table_name}"."notes" = 'group b') }
    let(:limited_sql) { %(SELECT "#{subject.table_name}".* FROM "#{subject.table_name}" LIMIT 5) }
    # rubocop:enable LineLength

    before do
      (1..10).each do |i|
        notes = i < 6 ? 'group a' : 'group b'
        subject.create!(name: "model #{i}",
                        notes: notes,
                        created_at: original_time,
                        updated_at: original_time)
      end
    end

    describe '#collection_cache_key' do
      it 'implements a cache key on collections' do
        digest = Digest::MD5.hexdigest(default_sql)
        subject.collection_cache_key
               .must_equal("#{cache_namespace}/query-#{digest}-10-#{original_time_str}")
      end

      it 'sets the cache key correctly when filtered' do
        collection = subject.where(notes: 'group b')
        digest = Digest::MD5.hexdigest(filtered_sql)
        subject.collection_cache_key(collection)
               .must_equal("#{cache_namespace}/query-#{digest}-5-#{original_time_str}")
      end

      it 'sets the cache_key correctly when limited' do
        collection = subject.limit(5)
        digest = Digest::MD5.hexdigest(limited_sql)
        subject.collection_cache_key(collection)
               .must_equal("#{cache_namespace}/query-#{digest}-10-#{original_time_str}")
      end

      it 'updates the cache_key when a record changes' do
        subject.first.update_attributes(updated_at: update_time)
        digest = Digest::MD5.hexdigest(default_sql)
        subject.collection_cache_key
               .must_equal("#{cache_namespace}/query-#{digest}-10-#{update_time_str}")
      end
    end

    describe '#cache_timestamp_format' do
      it 'sets the default timestamp format' do
        if ar_nsec?
          subject.cache_timestamp_format.must_equal(:nsec)
        else
          subject.cache_timestamp_format.must_equal(:number)
        end
      end
    end
  end
end

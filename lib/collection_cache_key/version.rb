module CollectionCacheKey
  module VERSION
    MAJOR = 0
    MINOR = 1
    PATCH = 3
    PRE = nil
    STRING = [MAJOR, MINOR, PATCH, PRE].compact.join('.')
  end

  def self.version
    Gem::Version.new VERSION::STRING
  end

  def self.version_string
    VERSION::STRING
  end
end

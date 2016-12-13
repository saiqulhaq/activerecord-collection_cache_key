## v0.1.0 - 2016-03-18

Initial Release

* This gem differs from current Rails master's implementation in two ways:
  * To support Rails 3, the 'default' relation includes a `WHERE (1=1)` clause,
    as a workaround for the fact that `.all` is an array in AR 3.
  * When limiting/offseting results, the limited size of the relation is not
    taken into account in the cache key; this will err toward expiring too much
    rather than too little, and will *always* do a count query regardless of
    whether the relation is loaded or not.

## v0.1.1 - 2016-04-01

Bugfix

* Corrects a bug where models with a `#size` or `#timestamp` method could
  fail to generate a proper cache key.

## v0.1.2 - 2016-04-26

Bugfix

* Corrects a bug in the PostgreSQL adapter where calling `first` when getting collection stats
  adds an implicit `order_by` on an unselected column.

## v0.1.3 - 2016-12-13

Bugfix

* Augments `ActiveRecord::Relation` with `:send` to support Ruby 2.0.0, which
  marked `.include` as a private module method.

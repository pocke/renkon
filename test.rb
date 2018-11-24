require 'renkon'
using Renkon::Patch

renkon = 10 <= Renkon.x <= 100
p renkon.to_range == (10..100) # => true

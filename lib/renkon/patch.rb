require "renkon/version"

module Renkon
  module CompareOperatorOverrider
    def <(r)
      if r.is_a?(Renkon::Range)
        r.> self
      else
        super
      end
    end

    def <=(r)
      if r.is_a?(Renkon::Range)
        r.>= self
      else
        super
      end
    end

    def >(r)
      if r.is_a?(Renkon::Range)
        r.< self
      else
        super
      end
    end

    def >=(r)
      if r.is_a?(Renkon::Range)
        r.<= self
      else
        super
      end
    end
  end

  module Patch
    klasses = [Integer, Float, String]
    klasses.each do |klass|
      refine klass do
        prepend CompareOperatorOverrider
      end
    end
  end
end

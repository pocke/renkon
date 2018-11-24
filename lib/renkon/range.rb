module Renkon
  class Range
    def initialize(gt: nil, gteq: nil, lt: nil, lteq: nil)
      @gt = gt
      @gteq = gteq
      @lt = lt
      @lteq = lteq
    end

    def <(r) dup.tap{|x|x.lt = r} end
    def <=(r) dup.tap{|x|x.lteq = r} end
    def >(r) dup.tap{|x|x.gt = r} end
    def >=(r) dup.tap{|x|x.gteq = r} end

    def to_range
      first =
        if gt
          gt.succ
        elsif gteq
          gteq
        end
      last = lt || lteq
      exclude_end = lt
      ::Range.new(first, last, exclude_end)
    end

    def ===(right)
      to_range === right
    end

    protected

    attr_accessor :gt, :gteq, :lt, :lteq
  end
end

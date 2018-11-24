require "renkon/version"
require_relative './renkon/patch'
require_relative './renkon/range'

module Renkon
  class Error < StandardError; end

  def self.x
    Renkon::Range.new
  end
end

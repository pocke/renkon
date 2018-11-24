require 'test_helper'

class TestRenkon < Minitest::Test
  using Renkon::Patch

  def test_renkon_initialize
    assert_instance_of Renkon::Range, 1 < Renkon.x < 10
  end

  def test_lt_gt
    range = (1 < Renkon.x < 10).to_range
    assert_equal 2...10, range

    range = ('a' < Renkon.x < 'd').to_range
    assert_equal 'b'...'d', range

    assert_raises(NoMethodError) {(1.0. < Renkon.x < 10).to_range}
  end

  def test_lteq_gteq
    range = (1 <= Renkon.x <= 10).to_range
    assert_equal 1..10, range

    range = ('a' <= Renkon.x <= 'd').to_range
    assert_equal 'a'..'d', range

    range = (1.0 <= Renkon.x <= 100.0).to_range
    assert_equal 1.0..100.0, range
  end

  def test_case
    assert(
      case 10
      when 20 < Renkon.x < 100
        false
      when 1 < Renkon.x < 10
        false
      when 10 <= Renkon.x <= 20
        true
      end
    )
  end

  def test_regression
    assert 1 < 10
    refute 10 < 1
    assert 1 <= 1
    assert 1 >= 1
    assert 100 > 0
    assert 1.0 < 2
    assert 'bar' < 'foo'
  end
end

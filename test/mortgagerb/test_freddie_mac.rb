require "test_helper"

class TestMortgagerbFreddieMac < Minitest::Test
  def test_fetch
    result = ::Mortgagerb::FreddieMac.fetch
  end

  def test_now
    result = ::Mortgagerb::FreddieMac.now
    assert_kind_of(Float, result[:fmr30])
    assert_kind_of(Float, result[:fmr15])
  end
end

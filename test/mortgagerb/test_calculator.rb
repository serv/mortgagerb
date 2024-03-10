require "test_helper"

class TestMortgagerbCalculator < Minitest::Test
  def test_periodic_interest_rate
    annual_rate = 5.5
    result = ::Mortgagerb::Calculator.periodic_interest_rate(annual_rate)
    assert result == annual_rate / 12
  end
end

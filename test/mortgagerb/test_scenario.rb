require "test_helper"

class TestMortgagerbScenario < Minitest::Test
  ANNUAL_RATE = 5.5
  YEARS = 30
  PRINCIPAL = 1000000
  TYPE = :thirty_year_fixed

  def test_initialize
    scenario = ::Mortgagerb::Scenario.new(PRINCIPAL, ANNUAL_RATE, TYPE)
    amortization_payment = scenario.calculate

    assert amortization_payment == 5677.89
  end
end

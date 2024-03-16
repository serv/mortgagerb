require "test_helper"

class TestMortgagerbScenario < Minitest::Test
  ANNUAL_RATE = 5.5
  YEARS = 30
  PRINCIPAL = 1_000_000
  TYPE = :thirty_year_fixed

  def test_initialize
    scenario = ::Mortgagerb::Scenario.new(PRINCIPAL, ANNUAL_RATE, TYPE)
    amortization_payment = scenario.calculate

    assert amortization_payment == 5677.89
    assert scenario.amortization_payment == 5677.89
  end

  def test_calculate_thirty_year_fixed_get_pricipal
    scenario = ::Mortgagerb::Scenario.new(5677.89, ANNUAL_RATE, :thirty_year_fixed_get_pricipal)
    principal = scenario.calculate

    assert principal.round == PRINCIPAL
    assert scenario.principal == PRINCIPAL
  end
end

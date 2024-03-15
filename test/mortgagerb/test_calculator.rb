require "test_helper"

class TestMortgagerbCalculator < Minitest::Test
  ANNUAL_RATE = 5.5
  YEARS = 30
  PRINCIPAL = 1_000_000

  def test_periodic_interest_rate
    result = ::Mortgagerb::Calculator.periodic_interest_rate(ANNUAL_RATE)
    assert result == ANNUAL_RATE / 100 / 12
  end

  def test_total_number_of_payments
    result = ::Mortgagerb::Calculator.total_number_of_payments(YEARS)
    assert result == YEARS * 12
  end

  def test_periodic_amortization_payment
    r = ::Mortgagerb::Calculator.periodic_interest_rate(ANNUAL_RATE)
    n = ::Mortgagerb::Calculator.total_number_of_payments(YEARS)
    a = ::Mortgagerb::Calculator.periodic_amortization_payment(PRINCIPAL, r, n)
    assert a == 5677.89
  end

  def test_principal_from_amortization_payment
    r = ::Mortgagerb::Calculator.periodic_interest_rate(ANNUAL_RATE)
    n = ::Mortgagerb::Calculator.total_number_of_payments(YEARS)
    a = 5677.89
    p = ::Mortgagerb::Calculator.principal_from_amortization_payment(a, r, n)
    assert p.round == PRINCIPAL
  end
end

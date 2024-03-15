module Mortgagerb
  class Calculator
    NUMBER_OF_MONTHS = 12

    # r
    def self.periodic_interest_rate(annual_rate)
      annual_rate / 100 / NUMBER_OF_MONTHS
    end

    # n
    def self.total_number_of_payments(years)
      years * NUMBER_OF_MONTHS
    end

    # A
    def self.periodic_amortization_payment(principal, rate, n)
      rate_multiplier = rate_plus_one_power_to_n(rate, n)
      (principal * (rate * rate_multiplier) / (rate_multiplier - 1)).round(2)
    end

    # P
    def self.principal_from_amortization_payment(amortization_payment, rate, n)
      rate_multiplier = rate_plus_one_power_to_n(rate, n)
      amortization_payment * (1 - (1 / rate_multiplier)) / rate
    end

    private

    # (1 + r) ^ n
    def self.rate_plus_one_power_to_n(rate, n)
      (1 + rate)**n
    end
  end
end

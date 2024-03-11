module Mortgagerb
  class Scenario
    def initialize(principal, rate, type)
      @principal = principal
      @rate = rate
      @type = type
      @amortization_payment = nil
    end

    def calculate
      if @type == :thirty_year_fixed
        r = Calculator.periodic_interest_rate(@rate)
        n = Calculator.total_number_of_payments(30)
        @amortization_payment = Calculator.periodic_amortization_payment(@principal, r, n)
      end
    end
  end
end

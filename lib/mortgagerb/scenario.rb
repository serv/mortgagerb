module Mortgagerb
  class Scenario
    def initialize(amount, rate, type)
      @amount = amount
      @rate = rate
      @type = type
      @amortization_payment = nil
      @principal = nil
    end

    def calculate
      if @type == :thirty_year_fixed
        r = Calculator.periodic_interest_rate(@rate)
        n = Calculator.total_number_of_payments(30)
        @amortization_payment = Calculator.periodic_amortization_payment(@amount, r, n)
      elsif @type == :thirty_year_fixed_get_pricipal
        r = Calculator.periodic_interest_rate(@rate)
        n = Calculator.total_number_of_payments(30)
        @principal = Calculator.principal_from_amortization_payment(@amount, r, n)
      end
    end
  end
end

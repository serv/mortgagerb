module Mortgagerb
  class Scenario
    attr_accessor :amortization_payment, :principal

    def initialize(amount, rate, type)
      @amount = amount
      @rate = rate
      @type = type
      @amortization_payment = nil
      @principal = nil
    end

    def calculate
      if %i[thirty_year_fixed three_year_arm five_year_arm seven_year_arm ten_year_arm].include?(@type)
        r = Calculator.periodic_interest_rate(@rate)
        n = Calculator.total_number_of_payments(30)
        @amortization_payment = Calculator.periodic_amortization_payment(@amount, r, n)
      elsif %i[thirty_year_fixed_get_pricipal three_year_arm_get_principal five_year_arm_get_principal
               seven_year_arm_get_principal ten_year_arm_get_principal].include?(@type)
        r = Calculator.periodic_interest_rate(@rate)
        n = Calculator.total_number_of_payments(30)
        @principal = Calculator.principal_from_amortization_payment(@amount, r, n)
      elsif @type === :twenty_year_fixed
        r = Calculator.periodic_interest_rate(@rate)
        n = Calculator.total_number_of_payments(20)
        @amortization_payment = Calculator.periodic_amortization_payment(@amount, r, n)
      elsif @type === :twenty_year_fixed_get_principal
        r = Calculator.periodic_interest_rate(@rate)
        n = Calculator.total_number_of_payments(20)
        @principal = Calculator.principal_from_amortization_payment(@amount, r, n)
      elsif @type === :fifteen_year_fixed
        r = Calculator.periodic_interest_rate(@rate)
        n = Calculator.total_number_of_payments(15)
        @amortization_payment = Calculator.periodic_amortization_payment(@amount, r, n)
      elsif @type === :fifteen_year_fixed_get_principal
        r = Calculator.periodic_interest_rate(@rate)
        n = Calculator.total_number_of_payments(15)
        @principal = Calculator.principal_from_amortization_payment(@amount, r, n)
      elsif @type === :ten_year_fixed
        r = Calculator.periodic_interest_rate(@rate)
        n = Calculator.total_number_of_payments(10)
        @amortization_payment = Calculator.periodic_amortization_payment(@amount, r, n)
      elsif @type === :ten_year_fixed_get_principal
        r = Calculator.periodic_interest_rate(@rate)
        n = Calculator.total_number_of_payments(10)
        @principal = Calculator.principal_from_amortization_payment(@amount, r, n)
      end
    end
  end
end

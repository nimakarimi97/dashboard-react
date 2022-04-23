module SavingsAccount
  def self.interest_rate(balance)
    case
    when balance < 0
      -3.213
    when balance < 1000
      0.5
    when balance < 5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    (interest_rate(balance).abs / 100 + 1) * balance
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    while current_balance < desired_balance
      current_balance = annual_balance_update(current_balance)
      years += 1
    end

    years
  end
end

puts SavingsAccount.interest_rate(-0.123)

puts SavingsAccount.annual_balance_update(-0.123)

puts SavingsAccount.years_before_desired_balance(1000.0, 1100.0)
#=> 14
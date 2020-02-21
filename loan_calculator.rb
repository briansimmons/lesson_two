def prompt(message)
  Kernel.puts("=>  #{message}")
end

loop do
  prompt("Welcome to the loan calculator! How much is your total loan value?")

  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp()
    if loan_amount.empty?() || loan_amount.to_f() < 0
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  prompt("What is the Annual Percentage Rate (APR) on this loan? (ex. 3.5)")

  apr = ''
  loop do
    apr = Kernel.gets().chomp()
    if apr.empty?() || apr.to_f() < 0
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  prompt("What is the length of the loan in years? (ex. 20)")

  loan_duration_years = ''
  loop do
    loan_duration_years = Kernel.gets().chomp()
    if loan_duration_years.empty?() || loan_duration_years.to_f() < 0
      prompt("Please enter a valid number.")
    else
      break
    end
  end

  apr_years = apr.to_f() / 100
  apr_months = apr_years / 12
  loan_duration_months = loan_duration_years.to_i() * 12

  monthly_payment = loan_amount.to_f() *
                    (apr_months /
                    (1 - (1 + apr_months)**(-loan_duration_months)))

  prompt("Your monthly payment would be #{monthly_payment}")
  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")
  prompt("Would you like to enter another calculation?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for using the loan calculator!")
prompt("Goodbye!")

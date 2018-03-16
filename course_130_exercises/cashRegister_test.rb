# cashRegister_test.rb

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'
require 'stringio'

class CashRegisterTest < MiniTest::Test

  def test_accept_money
    transaction = Transaction.new(1.0)
    register = CashRegister.new(5.0)
    transaction.amount_paid = 1.0

    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal(previous_amount + 1.0, current_amount)
  end

  def test_change
    transaction = Transaction.new(5)
    register = CashRegister.new(100)
    transaction.amount_paid = 10
    change = register.change(transaction)
    assert_equal(5, change)
  end

  def test_give_receipt
    item_cost = 5
    transaction = Transaction.new(item_cost)
    register = CashRegister.new(100)
    transaction.amount_paid = 10
    assert_output("You've paid $#{item_cost}.\n") do 
      register.give_receipt(transaction)
    end
  end

end

class TransactionTest < MiniTest::Test

  def test_prompt_for_payment
    transaction = Transaction.new(30)
    user_input = StringIO.new('30\n')
    user_output = StringIO.new('')
    transaction.prompt_for_payment(input: user_input, output: user_output)
    assert_equal(30, transaction.amount_paid)
  end
end
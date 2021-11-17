# frozen_string_literal: true

# NOTE: the Abstract Factory design pattern that tells about
#       having a "main" factory class (abstract) interact with all
#       concrete factory classes.

class Payment

  attr_accessor :from, :to, :amount

  def initialize from:, to:, amount:
    @from = from
    @to = to
    @amount = amount
  end

  def process; end
end

class CreditCard < Payment

  def initialize from:, to:, amount:
    super from: from, to: to, amount: amount
  end

  def process
    puts "processing U$#{amount} with credit card, from: #{from} to: #{to}"
  end
end

class Debit < Payment

  def initialize from:, to:, amount:
    super from: from, to: to, amount: amount
  end

  def process
    puts "processing U$#{amount} with debit card, from: #{from} to: #{to}"
  end
end

class Pix < Payment

  def initialize from:, to:, amount:
    super from: from, to: to, amount: amount
  end

  def process
    puts "processing U$#{amount} with pix, from: #{from} to: #{to}"
  end
end

class PaymentFactory

  attr_reader :from, :to, :amount

  def initialize from:, to:, amount:
    @from = from
    @to = to
    @amount = amount
  end

  def process; end

end

class CreditCardFactory < PaymentFactory

  def initialize from:, to:, amount:
    super from: from, to: to, amount: amount
  end

  def process
    CreditCard.new(from: from, to: to, amount: amount).process
  end
end

class DebitFactory < PaymentFactory

  def initialize from:, to:, amount:
    super from: from, to: to, amount: amount
  end

  def process
    Debit.new(from: from, to: to, amount: amount).process
  end
end

class PixFactory < PaymentFactory

  def initialize from:, to:, amount:
    super from: from, to: to, amount: amount
  end

  def process
    Pix.new(from: from, to: to, amount: amount).process
  end
end

class PaymentMachine

  AVAILABLE_PAYMENT_METHODS = {
    "credit_card": CreditCardFactory,
    "debit": DebitFactory,
    "pix": PixFactory,
  }

  attr_accessor :payment_method

  def initialize payment_method: "credit_card"
    @payment_method = payment_method_with name: payment_method
  end

  def set new_payment_method:
    @payment_method = payment_method_with name: new_payment_method
    self
  end

  def process from:, to:, amount:
    payment_method.new(from: from, to: to, amount: amount).process
    self
  end

  private

  def payment_method_with name: ""
    AVAILABLE_PAYMENT_METHODS[name.to_sym]
  end
end


payment_machine = PaymentMachine.new

payment_machine.set(new_payment_method: "credit_card").process(
  from: "lucas",
  to: "neusa",
  amount: 20000
)

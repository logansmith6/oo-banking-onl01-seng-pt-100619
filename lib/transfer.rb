require 'pry'
class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  @@executed_huh = 0
  @@backup_amount = 0
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
    @@backup_amount = @amount
  end

  def valid?
    if @receiver.valid? && @sender.valid? && @sender.balance >= @amount
      true
    else
      false
    end
  end

  def execute_transaction

      if valid?
        @status = "complete"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @amount = 0
        @@executed_huh = 1
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
      #binding.pry
  end

  def reverse_transfer

    if @status == "complete"
      @status = "reversed"
      @sender.balance += @@backup_amount
      @receiver.balance -= @@backup_amount
      #@@backup_amount = 0
    else
      "what"
    #  binding.pry
    end



  end

end

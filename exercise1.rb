class BankAccount

  @@interest_rate= 0.04
  @@accounts = []

  def initialize
    @balance = 0.00
  end

    def self.create
      account=BankAccount.new
      @@accounts.push(account)
      return account
    end

    def self.total_founds
      founds=0
      @@accounts.each do |account|
        founds += account.balance
    end
    return founds
  end

    def self.interest_rate
      @@interest_rate
    end

      def self.interest_time
      @@accounts.each do |account|
        new_balance= account.balance * (1 + @@interest_rate)
        account.balance=new_balance
        puts "#{account.balance}"
       end
    end
    #Reader
    def balance
      @balance
    end
    #Writer
    def balance=(balance)
      @balance = balance
    end

    def deposit (amount)
      @balance+= amount
    end

    def withdraw (amount)
      @belance-= amount
    end
end
account1=BankAccount.create
account2=BankAccount.create
puts account1.balance
puts account1.deposit(100)
puts account2.deposit (200)
puts account1.balance
puts account2.balance
puts account1.deposit(50)
puts BankAccount.total_founds
 BankAccount.interest_time
puts BankAccount.total_founds

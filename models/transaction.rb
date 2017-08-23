require_relative("../db/sql_runner")
require("pg")

class Transaction


  attr_reader(:id, :amount, :date, :merchant_id, :tag_id)

  def initialize(options)
    @id = options["id"].to_i if options ['id']
    @amount = options["amount"]
    @date = options["date"]
    @merchant_id = options["merchant_id"].to_i
    @tag_id = options["tag_id"].to_i
  end

 
  def self.all()
    sql = "SELECT * FROM transactions;"
    result_hash = SqlRunner.run(sql)
    return result_hash.map {|transaction| Transaction.new(transaction)}
  end


  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id}"
    result = SqlRunner.run(sql).first
    transaction = Transaction.new(result)
    return transaction
  end


  def save()
    sql = "INSERT into transactions (amount, date, merchant_id, tag_id)
    VALUES ('#{@amount}', '#{@date}', '#{@merchant_id}', '#{@tag_id}') RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first()["id"].to_i
  end


  def self.total_amount_spent
    total = 0
    transactions = self.all
    transactions.each {|transaction| total+= transaction.amount.to_i} 
    return total
  end
  

  def self.current_budget()
    budget = 8000
    expenditure = self.total_amount_spent
    amount_available = budget - expenditure
      if (budget > expenditure)
        return "You still have £ #{amount_available} available!"
      else
        return "You've already spent more than your budget!"
      end
  end


  def merchant()
    sql = "SELECT * FROM merchants WHERE id = #{@merchant_id}"
    merchant = SqlRunner.run(sql).first
    return Merchant.new(merchant)
  end  
  

  def tag()
    sql = "SELECT * FROM tags WHERE id = #{@tag_id};"
    result = SqlRunner.run(sql).first
    return Tag.new(result)
  end
  

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end


  def self.delete(id)
    sql = "DELETE FROM transactions WHERE id = #{id}"
    SqlRunner.run(sql)
  end


  def update
    sql = "UPDATE transactions SET amount = '#{@amount}', date = '#{@date}', merchant_id = #{@merchant_id}, tag_id = '#{@tag_id}' WHERE id = #{@id}"
    SqlRunner.run(sql)
  end


# THESE FOLLOWING TWO METHODS WILL ALLOW TO GET THE TOTAL SPENT PER tag:

  def self.transactions_by_tag(tag_id)
    sql = "SELECT * FROM transactions WHERE tag_id = #{tag_id};"
    result_hash = SqlRunner.run(sql)
    return result_hash.map {|transaction| Transaction.new(transaction)}
  end 


  def self.total_spent_by_tag(tag_id)
    total = 0
    transactions = self.transactions_by_tag(tag_id) 
    transactions.each {|transaction| total+= transaction.amount.to_i}
    return total
  end


# THESE FOLLOWING TWO METHODS WILL ALLOW TO GET THE TOTAL SPENT PER merchant:

  def self.transactions_by_merchant(merchant_id)
    sql = "SELECT * FROM transactions WHERE merchant_id = #{merchant_id};"
    result_hash = SqlRunner.run(sql)
    return result_hash.map {|transaction| Transaction.new(transaction)}
  end


  def self.total_spent_by_merchant(merchant_id)
    total = 0
    transactions = self.transactions_by_merchant(merchant_id)
    transactions.each {|transaction| total+= transaction.amount.to_i}
    return total
  end


end
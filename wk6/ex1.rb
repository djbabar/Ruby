=begin
Exercise1. Write a class called Person that has balance as an instance variable and make it readable via an accessor.

p = Person.new(40000)
puts p.show_bal # calling the method
=end

#Person = Struct.new(:balance)
class Person
  def initialize(balance)
    @balance = balance
  end
  attr_reader :balance
  def show_bal
    balance
  end
end

p = Person.new(40000)
puts p.show_bal
p1 = Person.new('Bob')
puts p1.show_bal

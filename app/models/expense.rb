class Expense < ActiveRecord::Base
  # attr_accessor :name, :fee_1, :fee_2, :memo, :other
  default_scope lambda { order "created_at desc" }
end

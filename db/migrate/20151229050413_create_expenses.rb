class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :fee_1
      t.string :fee_2
      t.string :memo
      t.string :other
      t.timestamps
    end
  end
end

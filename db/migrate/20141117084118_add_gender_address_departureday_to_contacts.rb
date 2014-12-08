class AddGenderAddressDeparturedayToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :gender, :string
    add_column :contacts, :address, :string
    add_column :contacts, :departure_date, :string
  end
end

class CreateDepartures < ActiveRecord::Migration
  def change
    create_table :departures do |t|
      t.string :name
      t.string :filter_type
      t.text :url

      t.timestamps
    end
  end
end

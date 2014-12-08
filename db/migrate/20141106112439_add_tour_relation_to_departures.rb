class AddTourRelationToDepartures < ActiveRecord::Migration
  def change
    add_column :departures, :tour_id, :integer
  end
end

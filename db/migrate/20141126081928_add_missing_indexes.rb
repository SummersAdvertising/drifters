class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :departures, :tour_id
  end
end
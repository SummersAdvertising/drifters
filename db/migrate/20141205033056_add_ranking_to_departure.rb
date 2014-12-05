class AddRankingToDeparture < ActiveRecord::Migration
  def change
    add_column :departures, :ranking, :integer, default: 999
  end
end

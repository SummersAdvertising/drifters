class AddRankingEnnameToTours < ActiveRecord::Migration
  def change
    add_column :tours, :ranking, :integer, default: 999
    add_column :tours, :en_name, :string
  end
end

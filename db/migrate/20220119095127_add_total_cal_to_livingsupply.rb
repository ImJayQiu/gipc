class AddTotalCalToLivingsupply < ActiveRecord::Migration[6.0]
  def change
    add_column :livingsupplies, :total_cal, :integer
  end
end

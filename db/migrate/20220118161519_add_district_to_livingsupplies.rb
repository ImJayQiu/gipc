class AddDistrictToLivingsupplies < ActiveRecord::Migration[6.0]
  def change
    add_column :livingsupplies, :district, :string
  end
end

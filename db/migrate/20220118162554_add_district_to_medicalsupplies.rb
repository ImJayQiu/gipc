class AddDistrictToMedicalsupplies < ActiveRecord::Migration[6.0]
  def change
    add_column :medicalsupplies, :district, :string
  end
end

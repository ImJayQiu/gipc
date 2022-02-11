class AddUnitToMedicalitems < ActiveRecord::Migration[6.0]
  def change
    add_column :medicalitems, :unit, :string
    add_column :medicalitems, :safety, :integer
  end
end

class AddUnitToLivingitems < ActiveRecord::Migration[6.0]
  def change
    add_column :livingitems, :unit, :string
  end
end

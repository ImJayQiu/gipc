class AddSafetyToLivingitems < ActiveRecord::Migration[6.0]
  def change
    add_column :livingitems, :safety, :integer
  end
end

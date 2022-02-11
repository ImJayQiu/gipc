class AddCalToLivingitem < ActiveRecord::Migration[6.0]
  def change
    add_column :livingitems, :cal, :integer
  end
end

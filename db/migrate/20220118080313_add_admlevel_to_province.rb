class AddAdmlevelToProvince < ActiveRecord::Migration[6.0]
  def change
    add_column :provinces, :admlevel, :string
  end
end

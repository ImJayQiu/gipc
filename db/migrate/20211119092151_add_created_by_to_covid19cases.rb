class AddCreatedByToCovid19cases < ActiveRecord::Migration[6.0]
  def change
    add_column :covid19cases, :created_by, :string
    add_column :covid19cases, :edited_by, :string
  end
end

class CreateVaccines < ActiveRecord::Migration[6.0]
  def change
    create_table :vaccines do |t|
      t.string :name
      t.string :company
      t.string :country
      t.string :des
      t.string :remark

      t.timestamps
    end
  end
end

class CreateBackups < ActiveRecord::Migration[6.0]
  def change
    create_table :backups do |t|
      t.integer :cycle
      t.string :path
      t.string :remark

      t.timestamps
    end
  end
end

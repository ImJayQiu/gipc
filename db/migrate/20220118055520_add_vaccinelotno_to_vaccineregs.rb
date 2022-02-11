class AddVaccinelotnoToVaccineregs < ActiveRecord::Migration[6.0]
  def change
    add_column :vaccineregs, :vaccinelotno, :string
  end
end

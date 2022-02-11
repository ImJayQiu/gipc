class AddVaccinetypeToVaccineregs < ActiveRecord::Migration[6.0]
  def change
    add_column :vaccineregs, :vaccinetype, :string
  end
end

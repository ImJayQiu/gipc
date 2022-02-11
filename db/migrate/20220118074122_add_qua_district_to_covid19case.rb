class AddQuaDistrictToCovid19case < ActiveRecord::Migration[6.0]
  def change
    add_column :covid19cases, :qua_district, :string
  end
end

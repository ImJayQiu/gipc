class Medicalitem < ApplicationRecord

  def item_unit 
    "#{name} - #{unit}"
  end


end

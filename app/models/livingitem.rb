class Livingitem < ApplicationRecord

  def item_unit 
    "#{name} - #{unit}"
  end

end

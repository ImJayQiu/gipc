class Province < ApplicationRecord
    validates :name, presence:true, uniqueness: {case_sensitive: false}

def pro_pop 
  "#{name} - P:#{population}"
end


end

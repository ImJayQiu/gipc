
class Covid19case < ApplicationRecord

  before_create :update_created_by
  before_update :update_edited_by

  #validates :id_pass, presence:true, uniqueness: {case_sensitive: false}

  def update_created_by
    self.created_by = current_user_email
    self.edited_by = current_user_email
  end

  def update_edited_by
    self.edited_by = current_user_email
  end

  def current_user_email

    User.current_user.try(:email) || 'GIPC'

  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      to_hash = row.to_hash

      # Deal with to_hash header and data. Example Create
      Covid19case.create!(
        name: to_hash['name'],
        age: to_hash['age'],
        sex: to_hash['gender'],
        nationality: to_hash['nationality'],
        qua_province: to_hash['qua_province'],
        qua_district: to_hash['qua_district'],
        notification_date: to_hash['notification_date'],
        announce_date: to_hash['announce_date'],
        onset_province: to_hash['onset_province'],
        onset_district: to_hash['onset_district'],
        status: to_hash['status'],
        id_pass: to_hash['id/passport'],
        remark1: to_hash['remark1'],
        remark2: to_hash['remark2']
      )

    end
  end


end

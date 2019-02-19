class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.by_date_and_user(date, user_id, collection=false)
    if collection == false
      self.where(created_at: date).where(user_id: user_id).first
    else
      self.where(created_at: date).where(user_id: user_id)
    end
  end

end

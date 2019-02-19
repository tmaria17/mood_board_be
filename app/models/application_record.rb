class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.by_date_and_user(date, user_id, collection=false)
    if collection == false
      self.where(created_at: date).where(user_id: user_id).first
    else
      self.where(created_at: date).where(user_id: user_id)
    end
  end

  def self.within_period_by_user(user_id, date)
    formatted_date = Date.strptime(date, '%Y-%m')
    self.where(user_id: user_id).where(created_at: formatted_date.beginning_of_month..formatted_date.end_of_month)
  end

end

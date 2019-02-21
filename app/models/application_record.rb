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
    queried_month = Date.strptime(date, '%Y-%m')
    x = self.where(created_at: queried_month.beginning_of_month..queried_month.end_of_month).where(user_id: user_id)
  end

end

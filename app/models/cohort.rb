class Cohort < ApplicationRecord
  has_many :validusers
  has_many :users

  def active?
    Date.today.between?(self.start + 9.weeks, self.end)
  end
end

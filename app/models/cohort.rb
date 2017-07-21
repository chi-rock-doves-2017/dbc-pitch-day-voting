class Cohort < ApplicationRecord
  has_many :validusers
  has_many :users

  def active
    Date.today.between?(self.start + 9.weeks, self.end)
  end

  def phase_3?
    Date.today.between?(self.start + 15.weeks, self.end)
  end

  def self.current_cohort
    Cohort.all.each do |cohort|
     if cohort.phase_3?
        return cohort.name
      end
    end
  end
end

class Cohort < ApplicationRecord
  has_many :validusers
  has_many :users
  has_many :pitches

  def active?
    Date.today.between?(self.start + 9.weeks, self.end)
  end

  def phase_3?
    Date.today.between?(self.start + 15.weeks, self.end)
  end

  def self.current_cohort
    Cohort.all.each do |cohort|
     if cohort.phase_3? && cohort.name != "Staff"
        return cohort
      end
    end
  end
end

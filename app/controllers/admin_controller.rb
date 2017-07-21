class AdminController < ApplicationController
  def index
    @cohort = Cohort.find_by(name: Cohort.current_cohort)
  end
end

class CohortController < ApplicationController
  def update
  	cohort = Cohort.find(params[:cohort][:id])
    cohort.pitch_start = Time.now

    cohort.save

    redirect_to admin_path
  end
end

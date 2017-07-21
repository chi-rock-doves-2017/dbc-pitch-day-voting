class CohortController < ApplicationController
  def update
    p params[:cohort][:admin_action]
    cohort = Cohort.find(params[:cohort][:id])
    if params[:cohort][:admin_action] == 'pitch_start'
      cohort.pitch_start = Time.new
    elsif params[:cohort][:admin_action] == 'pitch_end'
      cohort.pitch_end = Time.new
    elsif params[:cohort][:admin_action] == 'round_one_voting_start'
      cohort.round_one_voting_start = Time.new
    elsif params[:cohort][:admin_action] == 'round_one_voting_end'
      cohort.round_one_voting_end = Time.new
    elsif params[:cohort][:admin_action] == 'round_two_voting_start'
      cohort.round_two_voting_start = Time.new
    elsif params[:cohort][:admin_action] == 'round_two_voting_end'
      cohort.round_two_voting_end = Time.new
    else
      p "you suck"
    end
    cohort.save
    redirect_to admin_path
  end
end

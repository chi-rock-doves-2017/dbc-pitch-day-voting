class PitchesController < ApplicationController
  def index
    @pitches = Pitch.all
  end

  def new
      @pitch = Pitch.new
  end

  def create
    @pitch = Pitch.new(pitch_params)
    @pitch.cohort = Cohort.find_by(name: Cohort.current_cohort)

    if @pitch.save
      redirect_to pitches_path, notice: 'pitch was successfully created.'
    else
      render :new, status: 422
    end
  end

  private
  def pitch_params
    params.require(:pitch).permit(:title, :description, :pitchers, :user_id)
  end
end

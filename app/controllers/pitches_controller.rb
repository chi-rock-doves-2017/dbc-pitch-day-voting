class PitchesController < ApplicationController
  def index
    @pitches = Pitch.all
  end

  def new
    if logged_in?
      @pitch = Pitch.new
    else
      redirect_to root_url
    end
  end

  def create
    @pitch = Pitch.new(pitch_params)

    if @pitch.save
      redirect_to pitches_path, notice: 'pitch was successfully created.'
    else
      render :new, status: 422
    end
  end

  private
  def pitch_params
    params.require(:pitch).permit(:title, :description, :pitchers)
  end
end

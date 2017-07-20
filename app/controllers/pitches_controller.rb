class PitchesController < ApplicationController
  def index
    @pitches = Pitch.all
  end

  def new
    @pitch = Pitch.new
  end

  def create
    @pitch = Pitch.new(pitch_params)

    if @pitch.save
      redirect_to root_path, notice: 'pitch was successfully created.'
    else
      render :new, status: 422
    end
  end

  private
  def pitch_params
    params.require(:pitch).permit(:title, :description, :pitchers)
  end
end

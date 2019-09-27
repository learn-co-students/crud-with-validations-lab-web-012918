class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  def edit
    # render :form
  end
  def new
    @song = Song.new
    # render :form
  end
  def create
    @song = Song.new(songs_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
      # render :form
    end
  end
  def update
    @song.assign_attributes(songs_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
      # render :form
    end
  end
  def index
    @songs = Song.all
  end
  def show

  end
  def destroy
    @song.destroy
    redirect_to songs_path
  end
  def songs_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
  def set_song
    @song = Song.find(params[:id])
  end
end

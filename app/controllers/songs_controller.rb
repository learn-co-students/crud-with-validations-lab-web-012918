class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy, :form, :form_errors]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @song.assign_attributes(song_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end


  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end

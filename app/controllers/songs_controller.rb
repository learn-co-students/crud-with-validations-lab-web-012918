class SongsController < ApplicationController

  before_action :set_song, only: [:edit, :show, :update, :destroy]

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(get_song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(get_song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def index
    @songs = Song.all
  end

  def destroy
    @song.delete
    redirect_to songs_path
  end

  private
  def set_song
    @song = Song.find(params[:id])
  end

  def get_song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end


end

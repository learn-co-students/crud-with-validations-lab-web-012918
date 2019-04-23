class SongsController < ApplicationController

  before_action :get_song, only: [:new, :show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to '/songs'
  end

  private

    def song_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

    def get_song
      @song = Song.find(params[:id])
    end

end

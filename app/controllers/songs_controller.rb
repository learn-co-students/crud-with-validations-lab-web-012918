require 'pry'
class SongsController < ApplicationController

  def new
    @song = Song.new
  end

  def create
    # binding.pry
    # @song_find = Song.find_by(title: params[:song][:title], release_year: params[:song][:release_year])
    @song = Song.create(song_params)
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end


  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end





  def destroy
    @song = Song.find_by(params[:id])
    @song.delete
    redirect_to '/songs'
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end

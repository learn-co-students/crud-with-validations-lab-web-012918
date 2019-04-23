class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.all.find_by_id(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(user_params(:artist_name, :title, :released, :release_year, :genre))
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.all.find_by_id(params[:id])
  end

  def update
    @song = Song.all.find_by_id(params[:id])
    if @song.update(user_params(:artist_name, :title, :released, :release_year, :genre))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.all.find_by_id(params[:id]).destroy
    redirect_to songs_path
  end

  private
    def user_params(*args)
      params.require(:song).permit(*args)
    end
end

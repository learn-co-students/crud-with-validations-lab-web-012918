class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validate :release_year_cannot_be_future, :released_true, :double_release


  def released_true
    if released == true && release_year==nil
      errors.add(:release_year, "need a release year for a released song")
    end
  end

  def release_year_cannot_be_future
    if release_year.to_i > Date.today.year.to_i
      errors.add(:release_year, "can't be in the future")
    end
  end

  def double_release
    if song = Song.find_by(title: title)
      if  song.artist_name == artist_name && song.release_year == release_year
        errors.add(:release_year, "can't release the same song twice in a year")
      end
    end
  end
end

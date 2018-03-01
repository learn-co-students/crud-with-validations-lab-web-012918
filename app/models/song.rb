class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  # validate :release_date_future?
  validate :release_year_valid?
  # validate :released?
  # validate :song_released_already?
  # validates :release_year, :acceptance => true
  # validates :release_year, presence: true

  # def release_date_future?
  #   current_year = Time.now.year
  #   if self.release_year  && current_year < self.release_year
  #     errors.add(:released, "Released")
  #   else
  #     true
  #  end
  # end
  #
  #
  # def released?
  #   if !self.release_year && self.released == true
  #     errors.add(:release_year, "Released Can't Be True If Song Hasn't Been Released")
  #   end
  # end
  #
  # def song_released_already?
  #   @song = Song.find_by(title: self.title, release_year: self.release_year)
  #   if @song != nil
  #     errors.add(:released, "Song Already Released")
  #   end
  # end
  def release_year_valid?
    if self.released
      if !self.release_year
        errors.add(:release_year, "No release given.")
      elsif self.release_year > Time.now.year
        errors.add(:release_year, "Release year is in future")
      elsif self.release_year < Time.now.year
        return true
      end
    else
      if !self.release_year
        return true
      else
        errors.add(:release_year, "Cant have release year if song hasnt been released")
      end
    end
  end

end

class Song < ActiveRecord::Base
  validates :title, :artist_name, :genre, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, numericality: { only_integer: true }, allow_nil: true
  validate :release_year_issues, :released_this_year

  def release_year_issues
    if released == false && release_year != nil && release_year <= Date.today.year
      errors.add(:released, "If not released, year must be nil or in the future.")
    elsif released == true && release_year == nil
      errors.add(:released, "Needs release year if released.")
    elsif released == true && release_year > Date.today.year
      errors.add(:released, "Song can't be released with release year in the future.")
    end
  end

  def released_this_year
    if song = Song.find_by(title: title, artist_name: artist_name, genre: genre, released: released, release_year: release_year)
      errors.add(:release_year, "Song was already released this year")
    end
  end
end

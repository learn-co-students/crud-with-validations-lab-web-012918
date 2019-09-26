class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  validate :released_checker, :release_year_checker

  def released_checker
    if released == true && release_year == nil
      errors.add(:release_year, "Must exist")
    end
  end

  def release_year_checker
    if release_year != nil && release_year > Time.current.year
      errors.add(:release_year, "That date is in the future!")
    end
  end



end

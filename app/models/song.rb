class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year, message: "should be used only once per year" }
  validates :artist_name, presence: true
  validate :release_year_cannot_be_in_the_future, :release_year_needed_when_released

  def release_year_cannot_be_in_the_future
    errors.add(:release_year, "can't be in the future") if
      !release_year.blank? and release_year > Time.current.year
  end

  def release_year_needed_when_released
    if released == true && release_year == nil
      errors.add(:release_year, "is required when it has been released")
    end
  end
end

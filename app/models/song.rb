class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year, message: "Can't release the same song twice!"}
  validates :artist_name, presence: true
  validate :check_released

  def check_released
    if released && !release_year
      errors.add(:release_year, "Must have a release year!")
    elsif released && release_year && release_year > Date.today.year
      errors.add(:release_year, "Can't be released in the future!")
    end
  end
end

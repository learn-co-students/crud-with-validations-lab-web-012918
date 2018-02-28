require 'date'
class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "that artist already made that song this year"}
  validate :has_release_year, :not_released_in_future,

  def has_release_year
    if !!release_year != released
      self.errors.add(:release_year, 'No release year')
    end
  end

  def not_released_in_future
    if release_year && release_year.to_i > DateTime.now.year.to_i
      self.errors.add(:release_year, 'Released in future')
    end
  end

end

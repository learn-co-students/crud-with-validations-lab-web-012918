class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}, if: :released?

  # validates :artist_name, presence: true
  #
  # validate :title_artist_year
  # validate :optional_if_not_released
  #
  #
  # def title_artist_year
  #   if Song.all.include?(self.title)
  #     return errors.add(:title, "must be unique")
  #   end
  # end
  #
  # def optional_if_not_released
  #   if !self.released
  #     validate! :release_year, presence: false
  #   end
  # end
end

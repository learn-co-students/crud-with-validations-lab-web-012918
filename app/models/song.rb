class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  # released must be true or false
  validates :released, inclusion: { in: [true, false] }
  # title Cannot be repeated by the same artist in the same year
  validates :title, uniqueness: {scope: :release_year, message: "can only release a song with the same title once per year"}
  validate :current_year
  validate :release_true
  # release_year Optional if released is false,
  # Must not be blank if released is true
  # Must be less than or equal to the current year

  def release_true
    if self.released && self.release_year.class != Fixnum
      self.errors.add(:release_year, "The release year must exist")
    end
  end

  def current_year
    if self.released && self.release_year && self.release_year >= 2018
      self.errors.add(:release_year, "The release year must be in the past!")
    end
  end

end

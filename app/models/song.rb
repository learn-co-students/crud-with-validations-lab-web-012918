require 'date'
class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}, if: :released? ## need the if: :released? here
  # validates :release_year, allow_blank: true, unless: :released? dont need this
  validates :released, inclusion: { in: [ true, false ] }



end

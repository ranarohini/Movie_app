# Movie model
class Movie < ActiveRecord::Base
  # Model level validations
  validates_presence_of :title, :description, :year_released
  validates :year_released, numericality: { only_integer: true,
                                            message: 'is invalid' }
  validates :year_released, length: { minimum: 4,
                                      too_short: 'is invalid' }

  # Searches movies
  def self.search(search)
    if search
      Movie.where('title LIKE ?', "%#{search}%")
    else
      Movie.all
    end
  end
end

class Appointment < ApplicationRecord
  belongs_to :user

  validates :time, presence: true, uniqueness: true

  def display
    return "Appointment for #{user.name} at #{display_date}"
  end

  def display_date
    time.to_formatted_s(:long_ordinal)
  end
end

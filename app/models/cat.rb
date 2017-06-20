# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birthdate   :date             not null
#  color       :text             not null
#  name        :text             not null
#  sex         :text             not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  validates :birthdate, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in:  %w(calixico brown black white grey blue),
  message: "%{value} is not a valid color." }
  validates :sex, inclusion: { in:  %w(M F N),
  message: "%{value} is not a valid sex." }

  has_many :cat_rental_requests, :dependent => :destroy,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest

  def age
    (Time.now.year - self.birthdate.to_time.year)
  end
end

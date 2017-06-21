# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :text             default("PENDING"), not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED),
  message: "%{value} is not a valid status"}
  validate :does_not_overlap_approved_request

  belongs_to :cat,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :Cat


  def overlapping_requests
    CatRentalRequest.where("start_date <= ? AND end_date >= ? AND cat_id = ?",self.end_date,self.start_date,self.cat_id)
  end

  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end
  def does_not_overlap_approved_request
    self.errors[:base] << "overlapping_requests!" if overlapping_approved_requests.exists?
  end
end

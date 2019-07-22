class DetailCourse < ApplicationRecord
  belongs_to :user
  belongs_to :cour
  validates :user_id, :cour_id, presence: true
end

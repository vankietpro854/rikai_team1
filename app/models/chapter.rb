class Chapter < ApplicationRecord
	belongs_to :cour
	validates :name, presence: true, length: { maximum: 60 }
	validates :content, :cour_id, presence: true
end

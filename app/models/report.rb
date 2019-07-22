class Report < ApplicationRecord
	belongs_to :user
	validates :title,  presence: true, length: { maximum: 60 }
	validates :user_id, :content, :time_learn, presence: true
end

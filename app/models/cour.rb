class Cour < ApplicationRecord
	validates :name,  presence: true, length: { maximum: 60 }
	validates :content, :time_learn, presence: true
	has_many :chapters, dependent: :destroy
	has_many :detail_courses, dependent: :destroy
	mount_uploader :image_cours, ImageUploader
end

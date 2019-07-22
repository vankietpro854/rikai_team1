class Suport < ApplicationRecord
	validates :name,  presence: true, length: { maximum: 60 }
	validates :emai, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :subject,  presence: true
end

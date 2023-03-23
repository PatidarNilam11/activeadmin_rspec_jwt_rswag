class Student < ApplicationRecord
	validates :name, presence: true
	validates :roll_no, presence: true
	has_many :courses

	before_save :student_saved 
 
	def student_saved 
		self.name = name.upcase
	end


	scope :actives, -> { where(age: 21) } 
end

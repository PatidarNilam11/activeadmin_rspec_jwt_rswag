require 'rails_helper'

RSpec.describe Student, :type => :model do
	describe 'validation of name' do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:roll_no) }
	end

	describe 'has many association' do
 		it { should have_many(:courses).class_name(:Course) }
	end
 
  describe 'callback' do
  	it { is_expected.to callback(:student_saved).before(:save) }
   end
  
end
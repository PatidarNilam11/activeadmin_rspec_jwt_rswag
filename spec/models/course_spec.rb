require 'rails_helper'

RSpec.describe Course, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'association' do
		it { should belong_to(:student).class_name(:Student)}
 	end
end

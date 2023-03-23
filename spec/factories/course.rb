FactoryBot.define do
  factory :course, :class=>Course do
    cname {"demo"}
    # student_id {20}
    # association :student
    student_id { FactoryBot.create(:student).id}

  end 
end 
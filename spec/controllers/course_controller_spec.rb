require 'rails_helper'
# module AccountBlock
RSpec.describe CourseController, type: :controller do
  before(:each) do 
    @course = FactoryBot.create(:course) 
  end
  
  describe 'GET #index course list' do
    it 'display all course' do
      get 'index'
        expect(response.status).to eq 200
      end

    # it 'display with id' do
    #   get 'index' , params: { id: @course.id} 
    #   expect(response.status).to eq 200
    # end
    
    # it '#index  it is nil id' do
    #   get 'index' , params: { id: nil} 
    #   expect(response.status).to eq 200
    # end
  end 

  describe "GET  show profile" do
    it 'display other course profile' do  
      get 'show', params: { id: @course.id} 
      expect(response).to have_http_status :ok 
    end
  end

  describe "#create,#create student #post " do
    it 'Course create with' do 
      post 'create', params: { data:  { cname: 'Demoproject', student_id: 7 } } 
      expect(response.status).to eq 200
    end
    it 'course not create without student id' do 
      post 'create', params: { data:  { cname: 'Demoproject'} } 
      expect(response.status).to eq 200
    end
  end

  describe 'update' do 
    it 'update course with id' do 
      put :update, params:{id: @course.id}
      expect(response).to have_http_status :success
    end
    end

  describe 'destroy' do 
    it 'course delete with id' do 
      delete :destroy, params:{id: @course.id}
      expect(response).to have_http_status :success
    end
  end
end 
# end
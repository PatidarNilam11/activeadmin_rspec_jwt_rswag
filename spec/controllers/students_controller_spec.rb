require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  before(:each) do 
    @student = FactoryBot.create(:student) 
  end
  
  describe 'GET #index students list' do
    it 'display all students' do
      get 'index'
      expect(response.status).to eq 200
    end

    # it 'display with id' do
    #   get 'index' , params: { id: @student.id} 
    #   expect(response.status).to eq 200
    # end

    # it '#index  it is nil id' do
    #   get 'index' , params: { id: nil} 
    #   expect(response.status).to eq 200
    # end
  end 

  describe "GET  show profile" do
    it 'display other student profile' do  
      get 'show', params: { id: @student.id} 
      expect(response).to have_http_status :ok 
    end
  end

  describe "#create, student #post " do
    it 'Student create with' do 
      post 'create', params: { data:  { name: 'Demoproject', age: 30, roll_no: 333} } 
      expect(response.status).to eq 200
    end
  end

  describe 'update' do 
    it 'update student with id' do 
      put :update, params:{id: @student.id}
      expect(response).to have_http_status :success
    end
  end

  # describe 'destroy' do 
  #   it 'student delete with id' do 
  #     delete :destroy, params:{id: @student.id}
  #     expect(response).to have_http_status :success
  #   end

  #   # it 'it should not delete the student' do 
  #   #   delete :destroy, params:{id: 11}
  #   #   # delete :destroy, params:{id: @student.id}
  #   #   expect(response).to have_http_status 404
  #   # end
  # end
 
end
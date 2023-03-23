class StudentsController < ApplicationController
  def index
    @students = Student.all
    render json: @students
  end
    
  def show
    @student = Student.find(params[:id])
    render json: @student
	end    
    
  def create
    @student = Student.new(student_params)
		@student.save
		render json: @student
  end

  def update
    @student = Student.find(params[:id])
		if @student.update(student_params)
			render json: @student
		else
			render json: @student.errors.full_messages 
		end
  end

	def destroy
    @student = Student.find(params[:id])
		if @student
			@student.destroy
			# render json: @student
		else
			@student
			# render json: @student.errors.full_messages 
		end
  end

	private
	def student_params 
		params.permit(:name,:age,:roll_no)
	end
end

class CourseController < ApplicationController
  def index 
		@courses = Course.all
		render json: @courses 
	end
	
	def show 
		@course = Course.find(params[:id])
		render json: @course
	end

	def create
    @course = Course.new(course_params)
		@course.save
		render json: @course
  end

	def update
    @course = Course.find(params[:id])
		if @course.update(course_params)
			render json: @course
		else
			render json: @course.errors.full_messages 
		end
  end

	def destroy
    @course = Course.find(params[:id])
		if @course.destroy
			render json: @course
		else
			render json: @course.errors.full_messages 
		end
  end

	private
  def	course_params
		params.permit(:cname, :student_id)
	end 

end

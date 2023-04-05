class StudentsController < ApplicationController
  before_action :authorize_request, except: :create

  def index
    @students = Student.all
    render json: @students
  end

    def new
		@student = Student.new
		render json: @student
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
 
#   def edit
# 	@student = Student.find(student_params)
# 	render json: @student
#   end

	def update
		begin
      @student = Student.find(params[:id])
      if @student.update(student_params)
				render json: @student
			# else
			# 	render json: {"errors": @student.errors.messages}
			end
		rescue ActiveRecord::RecordNotFound => e
      render json: {message: "record not found"},status: :unprocessable_entity
		end
  end

	def destroy
		begin
      @student = Student.find(params[:id])
		  if @student.destroy
			  render json: @student
		# else
		#   render json: {message: "not found"},status: :unprocessable_entity
		#   # render json: @student.errors.full_messages 
		  end
	  rescue ActiveRecord::RecordNotFound => e
		  render json: {message: "#{params[:id]},not found"},status: :unprocessable_entity
		end 
	end
   
	private
	def student_params 
		params.permit(:name,:age,:roll_no)
	end
end

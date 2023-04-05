class UsersController < ApplicationController
    before_action :authorize_request, except: :create
    before_action :find_user, except: %i[create index]
  
    # GET /users
    def index
      @users = User.all
      render json: @users, status: :ok
    end
  
    # GET /users/{username}
    def show
      # byebug
      # @user = User.find(params[:username])
      render json: @user, status: :ok
    end
  
    # POST /users
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    def edit
      render json: @user
    end
  
    # PUT /users/{username}
    def update
      @user.update(user_params)
        render json: @user
        # render json:  { errors: @user.errors.full_messages },
        #        status: :unprocessable_entity
      # end
    end
  
    # DELETE /users/{username}
    def destroy
      # @user = User.find(params[:id])
      @user.destroy
        render json: @user
    end
  
    private
  
    def find_user
      @user = User.find_by_username!(params[:_username])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end
  
    def user_params
      params.permit(:username, :email, :password, :password_confirmation )
    end
end

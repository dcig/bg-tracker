class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to @user
        else
            render 'new'
        end
    end 

    def update
        @user = User.find(params[:id])
        @user.update!(user_params)
        
        redirect_to @user
    end 

    def destroy
    end 

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :basal_insulin, :bolus_insulin)
    end
end
#In the private class above, in order to get around the error I was encountering (according to stack overflow)
#I changed params.require(:users) > params.permit(:users)
#As of 5/10/19 I changed user_params to params.require and now my data that is being input via fields on the user creation
#is displaying - No errors so far navigating through the app
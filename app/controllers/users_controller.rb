class UsersController < ApplicationController
    def show
         @user = current_user
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        @user.update!(user_params)
        
        redirect_to @user
    end 

    def dexcom_token
        current_user.update!(dexcom_authorization_code: params[:code])

        if current_user.save!
            redirect_to current_user
            dexcom_token = Dexcom::Authorization.new(@user.create_token!)
            flash['success'] = 'Congrats! Your Dexcom account is connected'
        else
            redirect_to current_user
            flash['alert'] = 'Try again, please. :) Your Dexcom account did not connect'
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :basal_insulin, :bolus_insulin)
    end
end
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
      # 0a: Add a dexcom_authorization_code field to user model (migration!)
      # 0b: Update user edit page to say "thanks for linking your dexcom account"

      # IN THIS METHOD:
        # 1: Grab the "code" parameter from params 
        # 2: Update the dexcom_authorization_code field for the current_user
        # E.g., current_user.update!(dexcom_authorization_code: the_code_from_params)
        # 3: Redirect back to the user page, maybe set a flash message that says
        #    that dexcom authorization has been successful
        #    Flash, e.g.: flash['success'] = 'good job, you signed in to dexcom'
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

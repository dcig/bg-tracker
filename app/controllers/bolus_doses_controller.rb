class BolusDosesController < ApplicationController

    def new
         @bolus_dose = BolusDose.new
    end

    def create
        @bolus_dose = BolusDose.create((bolus_dose_params).merge(user_id: current_user.id))

        if @bolus_dose.save
            redirect_to current_user
            flash['success'] = 'Bolus dose added.'
        else
            err = @bolus_dose.errors.first
            flash[:danger] = "Error entering #{err[0]}, message: #{err[1]}."
            render 'new'
        end
    
    end

    #def update
        #@bolus_dose = current_bolus_dose
        #@bolus_dose.update!(bolus_dose_params)
         
        #redirect_to @bolus_dose
    #end 

    private
    def bolus_dose_params
        params.require(:bolus_dose).permit(:amount, :time_stamp)
    end
end

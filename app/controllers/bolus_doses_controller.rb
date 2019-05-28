class BolusDosesController < ApplicationController

    def new
         @bolus_dose = BolusDose.new
    end

    def create
        @bolus_dose = BolusDose.create((bolus_dose_params).merge(user_id: current_user.id))

        if @bolus_dose.save
            redirect_to '/welcome/index'
        else
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

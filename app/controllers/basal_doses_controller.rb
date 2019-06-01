class BasalDosesController < ApplicationController

    def new
         @basal_dose = BasalDose.new
    end

    def create
        @basal_dose = BasalDose.create((basal_dose_params).merge(user_id: current_user.id))

        if @basal_dose.save
            redirect_to '/users/:id'
        else
            render 'new'
        end
    
    end

    #def update
        #@basal_dose = current_basal_dose
        #@basal_dose.update!(basal_dose_params)
         
        #redirect_to @basal_dose
    #end 

    private
    def basal_dose_params
        params.require(:basal_dose).permit(:amount, :time_stamp)
    end
end

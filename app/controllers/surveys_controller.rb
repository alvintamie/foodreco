class SurveysController < ApplicationController

  def new
    @survey = current_user.survey
  end


  def update
    @survey = current_user.survey
    if @survey.update_attributes params[:survey]
      redirect_to survey_meals_path(@survey)
    else
      render :new
    end    
  end
end

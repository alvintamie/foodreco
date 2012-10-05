class SurveysController < ApplicationController

  def new
    @survey = current_user.survey
    redirect_to survey_meals_path @survey if @survey.valid?
  end


  def update
    @survey = current_user.survey
    if @survey.update_attributes params[:survey]
      redirect_to survey_meals_path(@survey)
    else
      render :new
    end    
  end

  
  def edit
    redirect_to new_survey_path and return if params[:secretsauce].blank?
    @survey = current_user.survey
  end

end

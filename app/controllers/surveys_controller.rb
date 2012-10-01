class SurveysController < ApplicationController
  def show
    
  end

  def new
    @survey = current_user.survey
  end

  def edit
    
  end

  def update
    @survey = current_user.survey
    if @survey.update_attributes params[:survey]
      redirect_to root_path
    else
      render :new
    end    
  end
end

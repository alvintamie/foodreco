class SurveysController < ApplicationController
  def show
    
  end

  def new
    @survey = current_user.build_survey
  end

  def create
    @survey = current_user.build_survey params[:survey]
    if @survey.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end
end

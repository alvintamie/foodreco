class MealsController < ApplicationController

  def index
   @meals = current_user.survey.meals
  end

  def new
    @survey = current_user.survey
    @meal  = @survey.meals.build
  end

  def create
    @survey = current_user.survey
    @meal = @survey.meals.build params[:meal]
    if @meal.save
      redirect_to survey_meals_path(@survey)
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

end

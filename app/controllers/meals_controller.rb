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
    @survey = current_user.survey
    @meal  = @survey.meals.find params[:id]
  end

  def update
    @survey = current_user.survey
    @meal = @survey.meals.find params[:id] 
    if @meal.update_attributes params[:meal]
      redirect_to survey_meals_path(@survey)
    else
      render :new
    end
  end

  def destroy
    @survey = current_user.survey
    @meal = @survey.meals.find params[:id]
    @meal.destroy
    redirect_to survey_meals_path @survey
  end

end

class LanguagesController < ApplicationController
  before_action :authorize
  before_action :check_admin

  def index
    @languages = Language.all
    @newlanguage = Language.new
  end

  def create
    @newlanguage = Language.new(language_params)
    @newlanguage.save

    if @newlanguage.save
      flash[:success] = "Added new language"
      redirect_to languages_path
    else
      flash[:error] = "Failed to create language"
      redirect_to languages_path
    end
  end

  def update
    @language = Language.find(params[:id])

    if @language.update
      flash[:success] = "Updated language"
      redirect_to languages_path
    else
      flash[:error] = "Failed to create language"
      redirect_to languages_path
    end
  end

  def destroy
    @language = Language.find(params[:id])
    @language.destroy

    if @language.destroy
      flash[:success] = "Deleted language"
      redirect_to languages_path
    else
      flash[:error] = "Failed to create language"
      redirect_to languages_path
    end

  end

  private

  def language_params
    params.require(:language).permit(:language_code, :language_name)
  end
end

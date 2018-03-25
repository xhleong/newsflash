class CountriesController < ApplicationController

  before_action :authorize
  before_action :check_admin

  def index
    @countries = Country.all
    @newcountry = Country.new
  end

  def create
    @newcountry = Country.new(country_params)

    if @newcountry.save
      flash[:success] = "Added new country"
      redirect_to countries_path
    else
      flash[:error] = "Failed to create country"
      redirect_to countries_path
    end
  end

  def update
    @country = Country.find(params[:id])

    if @country.update
      flash[:success] = "Updated country"
      redirect_to countries_path
    else
      flash[:error] = "Failed to create country"
      redirect_to countries_path
    end
  end

  def destroy
    @country = Country.find(params[:id])
    @country.destroy

    if @country.destroy
      flash[:success] = "Deleted country"
      redirect_to countries_path
    else
      flash[:error] = "Failed to create country"
      redirect_to countries_path
    end

  end

  private

  def country_params
    params.require(:country).permit(:country_code, :country_name)
  end

end

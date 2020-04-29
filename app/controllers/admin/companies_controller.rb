# frozen_string_literal: true

class Admin::CompaniesController < Admin::ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_attrs)

    if @company.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(company_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    company = Company.find(params[:id])
    company.destroy

    redirect_to action: :index
  end

  private

  def company_attrs
    params.require(:company).permit(:name, :city, :district, :address, :email_registration, :email_notification, :password, :phone, :service_id)
  end
end
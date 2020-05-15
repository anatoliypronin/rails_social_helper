# frozen_string_literal: true

class Web::Admin::CompaniesController < Web::Admin::ApplicationController
  def index
    @companies = Company.all.decorate
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

  def del
    company = Company.find(params[:company_id])
    company.del!

    redirect_to action: :index
  end

  def restore
    company = Company.find(params[:company_id])
    company.restore!

    redirect_to action: :index
  end

  private

  def company_attrs
    params.require(:company).permit(:name, :city, :district_id, :address, :email_registration, :email_notification, :password, :phone, :service_id)
  end
end

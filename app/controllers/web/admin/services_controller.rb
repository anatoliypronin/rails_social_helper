class Web::Admin::ServicesController < Web::Admin::ApplicationController
  def index
    @q = Service.ransack(params[:q])
    @services = @q.result.all.paginate(page: params[:page])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_attrs)
    if @service.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])

    if @service.update(service_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    service = Service.find(params[:id])
    service.destroy

    redirect_to action: :index
  end

  private

  def service_attrs
    params.require(:service).permit(:name)
  end
end

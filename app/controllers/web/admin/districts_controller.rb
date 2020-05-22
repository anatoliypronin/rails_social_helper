class Web::Admin::DistrictsController < Web::Admin::ApplicationController
  def index
    @q = District.ransack(params[:q])
    @districts = @q.result.all.paginate(page: params[:page])
  end

  def new
    @district = District.new
  end

  def create
    @district = District.new(district_attrs)
    if @district.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def edit
    @district = District.find(params[:id])
  end

  def update
    @district = District.find(params[:id])

    if @district.update(district_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    district = District.find(params[:id])
    district.destroy

    redirect_to action: :index
  end

  private

  def district_attrs
    params.require(:district).permit(:name, :city_id)
  end
end

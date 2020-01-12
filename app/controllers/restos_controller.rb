class RestosController < ApplicationController
  before_action :set_resto, only: [:show, :edit, :update, :destroy]
  def index
    @search = Resto.ransack(params[:q])
    if params[:q]
      @restos = @search.result(distinct: true)
    else
      @restos = Resto.all
    end
end
  def show
  end
  def new
    @resto = Resto.new
    3.times {@resto.break_fasts.build}
     3.times {@resto.lunches.build}
  end
  def edit
    1.times {@restos.breakfasts.build}
    1.times {@restos.lunches.build}
  end
  def create
    @resto = Resto.new(resto_params)
    respond_to do |format|
      if @resto.save
        format.html { redirect_to @resto, notice: 'Resto was successfully created.' }
        format.json { render :show, status: :created, location: @resto }
      else
        format.html { render :new }
        format.json { render json: @resto.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @resto.update(resto_params)
        format.html { redirect_to @resto, notice: 'Resto was successfully updated.' }
        format.json { render :show, status: :ok, location: @resto }
      else
        format.html { render :edit }
        format.json { render json: @resto.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @resto.destroy
    respond_to do |format|
      format.html { redirect_to restos_url, notice: 'Resto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    def set_resto
      @resto = Resto.find(params[:id])
    end
    def resto_params
      params.require(:resto).permit(:name, :location, :details, :image, :image_cache, break_fasts_attributes: [:id, :item, :price], lunches_attributes: [:id, :item, :price])
    end
end

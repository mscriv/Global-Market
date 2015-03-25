class BusinessesController < ApplicationController

  def index
    @businesses = Business.search(params[:category_id],params[:search])

  end

  def new
    @business = Business.new
  end

  def show
    @business = Business.find(params[:id])
  end

  def edit
    @business = Business.find(params[:id])
  end

  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def business_params
    params.require(:business).permit(:name, :address, :phone, :website, :image, :category_id)
  end
end

class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]


  def index
    @businesses = Business.search(params[:category_id],params[:search])

  end

  def new
    @business = Business.new
  end

  def show
  end

  def edit
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

  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to business_url, notice: 'Business has been successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :address, :phone, :website, :image, :category_id, :image)
  end
end

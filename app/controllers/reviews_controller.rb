class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_business



  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.business_id = @business.id
    respond_to do |format|
      if @review.save
        format.html { redirect_to @business, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
        end
        end
    end


  def update
    @review.update(review_params)
  end

  def destroy
    @review.destroy
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

  def set_business
    @business = Business.find(params[:business_id])
  end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end

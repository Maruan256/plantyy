class ReviewsController < ApplicationController

  def create
    @garden_kit = GardenKit.find(params[:garden_kit_id])
    @review = Review.new(review_params)
    @review.garden_kit = @garden_kit
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.html { redirect_to garden_kit_path(@garden_kit, anchor: "review-#{@review.id}") }
        format.json
      else
        format.html { render 'garden_kits/show' }
        format.json
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

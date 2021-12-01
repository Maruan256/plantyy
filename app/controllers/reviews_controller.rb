class ReviewsController < ApplicationController
  def create
    @garden_kit = GarednKit.find(params[:garden_kit_id])
    @review = Review.new(review_params)
    @review.garden_kit = @garden_kit
    # if the garden kit is in the user's garden, the user can leave a review
    # if it isn't in the user's garden,the form simply won't show
    if @review.save
      redirect_to garden_kit_path(@garden_kit)
    else
      render 'garden_kits/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end

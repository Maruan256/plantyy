if @review.persisted?
  json.form json.partial!('reviews/form.html.erb', garden_kit: @garden_kit, review: Review.new)
  json.inserted_item json.partial!('garden_kits/review.html.erb', review: @review)
else
  json.form json.partial!('reviews/form.html.erb', garden_kit: @garden_kit, review: @review)
end

module ProductsHelper
  DEFAULT_RATING = 3

  def average_rating(object)
    # ratings = object.comments.pluck(:rating)
    # sum = ratings.inject(:+)
    # sum.present? ? sum / ratings.count : DEFAULT_RATING
  end
end

module PagesHelper

  def average_rating(sum, total)
    sum / total
  end

  def sum_of_ratings(reviews)
    reviews.select { |review| review.rating }.map {|review| review.rating.rating }.sum
  end

  def total_ratings(reviews)
    reviews.select { |review| review.rating }.count
  end
end

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

  def attribution_text(category_name)
    attributions = {
      "Coffee & Tea": {
        photographer: "Carlos Alberto Gómez Iñiguez",
        url: "https://unsplash.com/@iniguez?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText"
      },
      "Chicken": {
        photographer: "Brian Chan",
        url: "https://unsplash.com/@tigerrulezzz?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText"
      },
      "Burgers": {
        photographer: "David Holifield",
        url: "https://unsplash.com/@davidholifield?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText"
      },
      "Sandwiches": {
        photographer: "S O C I A L . C U T",
        url: "https://unsplash.com/@socialcut?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText"
      },
      "Ice Cream": {
        photographer: "Lama Roscu",
        url: "https://unsplash.com/@lamaroscu?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText"
      },
      "Tacos": {
        photographer: "Krisztian Tabori",
        url: "https://unsplash.com/@ktabori?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText"
      }
    }

    "<p class='small'>Photo by <a href='#{attributions[category_name.to_sym][:url]}'>#{attributions[category_name.to_sym][:photographer]}</a> on Unsplash</p>"
  end
end

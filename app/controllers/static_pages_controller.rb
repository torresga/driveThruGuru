class StaticPagesController < ApplicationController
  def index
  end

  def search
    queries = []
    non_empty_params = search_params.select {|key, value| value != "" }

    if non_empty_params.has_key?("address")
      non_empty_params["address"] = "%#{non_empty_params["address"]}%"
    end

    non_empty_params.each do |key, value|
      if key == "address"
        queries << "restaurants.#{key} LIKE ?"
      elsif key == "name"
        queries << "categories.#{key} = ?"
      else
        queries << "restaurants.#{key} = ?"
      end
    end

    queries = queries.join(" AND ")

    @restaurants = Restaurant.joins(:categories).where(queries, *non_empty_params.values)
  end

  private

  def search_params
    params.require(:restaurant).permit(:name, :chain, :address)
  end
end

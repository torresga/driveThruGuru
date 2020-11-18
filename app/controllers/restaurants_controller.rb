class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(name: params[:name_of_business],
                                  chain: params[:chain],
                                  address: params[:address],
                                  phone_number: params[:phone_number],
                                  hours_of_operation: params[:hours])
    @restaurant.save
    render 'new'
  end

  def update
  end

  def edit
  end

  def delete
  end
end

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

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    p restaurant_params

    @restaurant.update(restaurant_params)

    redirect_to @restaurant
  end

  def delete
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :chain, :address, :phone_number, :hours_of_operation)
  end
end

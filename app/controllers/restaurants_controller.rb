class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new

    %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).each do |day|
      @restaurant.business_hours.build(day: day)
    end
  end

  def create
    @restaurant = Restaurant.create(
      name: restaurant_params[:name],
      chain: restaurant_params[:chain],
      address: restaurant_params[:address],
      phone_number: restaurant_params[:phone_number],
      categories: restaurant_params[:categories].map { |category| Category.find_by(name: category) }
      )

    restaurant_params[:business_hours_attributes].values.each do |day_params|
      @restaurant.business_hours.build(day_params)
    end

    @restaurant.save
    render 'restaurants/new'
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.update(
      name: restaurant_params[:name],
      chain: restaurant_params[:chain],
      address: restaurant_params[:address],
      phone_number: restaurant_params[:phone_number],
      categories: restaurant_params[:categories].map { |category| Category.find_by(name: category) }
    )

    restaurant_params[:business_hours_attributes].values.each_with_index do |day_params, index|
      @restaurant.business_hours[index].update(day_params)
    end

    redirect_to @restaurant
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy

    redirect_to "/"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :chain, :address, :phone_number, :hours_of_operation, :categories => [], :business_hours_attributes => [:open_at, :close_at, :day])
  end
end

class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new

    %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday).each do |day|
      @restaurant.business_hours.build(day: day)
    end

    puts @restaurant.business_hours
  end

  def create
    @restaurant = Restaurant.create(
      name: restaurant_params[:name],
      chain: restaurant_params[:chain],
      address: restaurant_params[:address],
      phone_number: restaurant_params[:phone_number],
      categories: restaurant_params[:categories].map { |category| Category.find_by(name: category) }
      )

      # @restaurant.business_hours.each do |day|
      #   restaurant_params[:business_hours_attributes].values.each do |day_params|
      #     # have to turn open_at and close at to a date
      #     day.update()
      #   end
      # end

    @restaurant.save
    # @restaurant.business_hours.save
    render 'restaurants/new'
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.update(restaurant_params)

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

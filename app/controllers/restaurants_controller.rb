class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = Review.where(restaurant_id: @restaurant.id.to_s)
  end

  def edit
  end

  def update
    @restaurant = Restaurant.update(restaurant_params)
    redirect_to restaurants_path
  end

  def destroy
    @restaurant.destory
    redirect_to restaurants_path
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end

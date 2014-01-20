class OrdersController < ApplicationController
  def index
  	@orders = Order.includes(:order_items => :product).all
  end

  def create
  	@order = Order.new order_params
  	if @order.save
  		redirect_to orders_path, notice: "Order was successfully placed."
  	else
  		redirect_to home_path, alert: "Something went wrong when placing the order."
  	end
  end

  private

  def order_params
  	params.require(:order).permit!
  end
end

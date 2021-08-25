class Admin::OrdersController < ApplicationController

def index
	@orders = Order.all
end

def show
	@order = Order.find(params[:id])
end

def update
	@order = Order.find(params[:id])
	@order.update(order_params)
	#binding.pry
	if
		@order.order_status == "pay_confirm"
		@order.order_details.each do |order_detail|
			order_detail.update(making_status:1)
		end

	end


	redirect_back(fallback_location: admin_orders_path)
end

private
def order_params
	params.require(:order).permit(:order_status)
end


end

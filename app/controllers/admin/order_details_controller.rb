class Admin::OrderDetailsController < ApplicationController
	def update
		@order_detail = OrderDetail.find(params[:id])
		@order_detail.update(order_detail_params)


		@order = @order_detail.order
		if @order_detail.making_status == "making"
			@order.update(order_status:2)
		end

		i = 0
		@order.order_details.each do |order_detail|
			if order_detail.making_status == "made"
				i += 1
		    end
		end

		    if i == @order.order_details.count
		    	@order.update(order_status:3)
		    end


		redirect_back(fallback_location: admin_orders_path)
	end

	private
	def order_detail_params
		params.require(:order_detail).permit(:making_status)
	end

end
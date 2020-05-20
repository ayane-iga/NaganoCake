class Public::OrdersController < ApplicationController

before_action :baria_end_user, only: [:new,:confirm,:create]

	def index
	end

	def complete
	end

	def confirm

		@cart_items = current_end_user.cart_items
		@order = Order.new
		@order.payment_method = params[:order][:payment_method].to_i

		if
			params[:address] == "0"
			@order.post_code = current_end_user.post_code
			@order.address = current_end_user.address
			@order.destination = current_end_user.last_name + current_end_user.first_name

		elsif
			params[:address] == "1"
			@address = Address.find(params[:address_id])
			@order.post_code = @address.post_code
			@order.address = @address.address
			@order.destination = @address.destination

		elsif
			params[:address] == "2"
			if params[:order][:post_code].empty? || params[:order][:address].empty? || params[:order][:destination].empty?
				redirect_to cart_items_path
			end
			@order.post_code = params[:order][:post_code]
			@order.address = params[:order][:address]
			@order.destination = params[:order][:destination]

		end
	end

	def new
		@order = Order.new
	end

	def show
	end

	def create

		@order = Order.new(order_params)
		@order.end_user_id = current_end_user.id
		@order.save!

		@cart_items = current_end_user.cart_items
		@cart_items.each do |cart_item|
			order_detail = OrderDetail.new
			order_detail.item_id = cart_item.item_id
			order_detail.amount = cart_item.amount
			order_detail.price = cart_item.item.tax_free_price * 1.1
			order_detail.order_id = @order.id
			order_detail.save!
			#binding.pry
		end

		subaddress = Address.new
		subaddress.end_user_id = current_end_user.id
		subaddress.post_code = @order.post_code
		subaddress.address = @order.address
		subaddress.destination = @order.destination
		subaddress.save

		@cart_items.destroy_all

		redirect_to orders_complete_path
	end

	private
	def order_params
		params.require(:order).permit(:payment_method,:address,:post_code,:destination)
	end

	def baria_end_user
		if current_end_user.cart_items.empty?
			redirect_to cart_items_path
		end
	end

end
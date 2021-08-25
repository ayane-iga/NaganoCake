class Public::CartItemsController < ApplicationController



	def index
		@cart_items = current_end_user.cart_items
	end

	def update
		cart_item = CartItem.find(params[:id])
		cart_item.update(cart_item_params)
		redirect_back(fallback_location: items_path)

	end

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_back(fallback_location: items_path)
	end

	def destroy_all
		current_end_user.cart_items.destroy_all
		redirect_back(fallback_location: items_path)
	end

	def create
		if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
			cart_item = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
			# binding.pry
			newamount = cart_item.amount + params[:cart_item][:amount].to_i
			cart_item.update(amount: newamount)
		else
			cart_item = CartItem.new(cart_item_params)
			cart_item.save
		end
		redirect_to cart_items_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:end_user_id,:amount,:item_id)
	end


end
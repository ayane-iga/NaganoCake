class Public::AddressesController < ApplicationController

def index
	@address = Address.new
    @addresses = Address.all
end

def edit
end

def create
	address = Address.new(address_params)
	address.save
	redirect_back(fallback_location: addresses_path)
end

def update
end

def destroy
end

private
def address_params
	params.require(:address).permit(:post_code,:address,:destination,:end_user_id)
end




end
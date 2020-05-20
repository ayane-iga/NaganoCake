class Admin::ItemsController < ApplicationController

def index
	@items = Item.search(params[:search])
end

def new
	@item = Item.new
end

def create
	item = Item.new(item_params)
	item.save
	redirect_to admin_item_path(item.id)
end

def show
end

def edit
end

def update
end

private

def item_params
	params.require(:item).permit(:genre_id,:name,:text,:is_valid,:tax_free_price,:item_image)
end

end
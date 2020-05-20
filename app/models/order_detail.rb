class OrderDetail < ApplicationRecord
	belongs_to :item
	belongs_to :order

	enum making_status:{unable_to_commit: 0,waiting_making: 1,making: 2,made: 3}
end

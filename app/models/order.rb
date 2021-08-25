class Order < ApplicationRecord

	enum order_status:{pay_waiting: 0,pay_confirm: 1,on_making: 2,send_preparation: 3, sent:4}
	enum payment_method:{credit: 0,bunking: 1}

	belongs_to :end_user
	has_many :order_details

	validates :post_code, presence:true
	validates :address, presence:true
	validates :destination, presence:true
end

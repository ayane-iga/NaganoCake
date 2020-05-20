class Address < ApplicationRecord

	belongs_to :end_user

    validates :post_code, presence:true
	validates :address, presence:true
	validates :destination, presence:true


def total_address
	post_code + address + destination
end

end

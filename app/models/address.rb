class Address < ApplicationRecord


def total_address
	post_code + address + destination
end

end

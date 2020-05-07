class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :post_code, presence:true
  validates :address, presence:true
  validates :phone_number, presence:true

   def active_for_authentication?
   	super && (self.is_valid == true )
   	#superはdeviseの元々の認証機能を継承してる
   	#かつ、退会していないか。つまり、これで退会しているユーザを省く！
   end
end

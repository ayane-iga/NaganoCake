class Public::EndUsersController < ApplicationController

	def show
	end

	def edit
		@end_user = EndUser.find(current_end_user.id)
	end

	def update
		@end_user = EndUser.find(current_end_user.id)
		if @end_user.update(end_user_params)
			redirect_to end_users_mypage_path
		else
			render :edit
		end
	end

	def withdraw
		@end_user = EndUser.find(current_end_user.id)
	#is_validカラムにフラグを立てる（デフォルトがtrue)
	@end_user.update(is_valid: false)
	#ログアウトさせる
	reset_session
	redirect_to root_path
end

private

def end_user_params
	params.require(:end_user).permit(:last_name,:first_name,:kana_last_name,:kana_first_name,:email,:post_code,:address,:phone_number)
end

end
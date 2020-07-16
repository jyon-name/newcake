class Public::EndUsersController < ApplicationController
 before_action :authenticate_end_user!
	def about
		@end_user =current_end_user
	end
	def edit
		@user =current_end_user
	end
	def update
		@user =current_end_user
		@user.update(user_params)
		redirect_to about_path
	end
	def confirm
	end

def withdraw
user =current_end_user
user.update(is_vaild: false)
reset_session
redirect_to root_path
end

private
def user_params
 params.require(:end_user).permit(:email, :last_name,:first_name, :last_name_kana, :first_name_kana, :is_vaild, :add_code, :address,:phone_number )
end
end
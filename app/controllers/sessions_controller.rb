class SessionsController < ApplicationController

	def new
	end

	def create
# We don't have to instantiate a user object in our new action
# because we are only logging in, not creating a new user.(i.e no USER.new)
		user = User.find_by(email: params[:email])
	# We find a user by the email typed in the email input field and assign it to the variable 'user'
		if user && user.authenticate(params[:password])
	# We check if that user exists and that it can be authenticated with the password typed in the password input field
			session[:user_id] = user.id
	# If both of those evaluate to 'true', we create a key-value pair in the session hash. ':user_id' is the key and the user's id is the value
			redirect_to '/sessions', notice: "Logged In"
	# The session key has been assigned, the user is redirected to the products index page

		else
			render "new"
		end
	end

	def show
		redirect_to'/'
	end

	def destroy
		session[:user_id] = nil
		flash[:notice]= "logged out"
		redirect_to "/pictures"

	end

end

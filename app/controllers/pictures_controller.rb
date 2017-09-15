class PicturesController < ApplicationController
	before_action :ensure_logged_in, except:[:show, :index]
	before_action :load_picture, only: [:show, :edit, :update, :destroy]
	before_action :ensure_user_owns_picture, only: [:edit, :update,:destroy]

	def load_picture
		@picture = Picture.find(params[:id])
	end

	def user
		User.find_by
	end


	def index
		@pictures = Picture.all
		@most_recent_pictures = Picture.most_recent_five
		@olderpictures = Picture.created_before 1.month.ago
		return
	end

	def show
	end

	def new
		@picture= Picture.new
	end

	def create
		@picture = Picture.new
		@picture.title = params[:picture][:title]
		@picture.artist = params[:picture][:artist]
		@picture.url = params[:picture][:url]
		@picture.created_at = params[:picture][:date]
		@picture.user_id = current_user.id

		if @picture.save
			#ifthe pic gets saves generate a getrequest to /pictures (the index)
			redirect_to "/pictures"
		else
			# otherwise render new.html.erb
			render :new
		end
	end

# In the create action in the PicturesController,
# before you call save on the new picture, make sure you are
# assigning the user_id attribute of the picture using current_user,
#  in addition to its other attributes.

	def edit
		@picture= Picture.find(params[:id])
	end

	def update
		@picture.title=params[:picture][:title]
		@picture.artist = params[:picture][:artist]
		@picture.url = params[:picture] [:url]

		if @picture.save
			redirect_to "/pictures/#{@picture.id}"
		else
			render :edit
		end
	end



	def destroy
		@picture.destroy
		redirect_to "/pictures"
	end
end

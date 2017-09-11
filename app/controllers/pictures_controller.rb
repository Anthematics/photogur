class PicturesController < ApplicationController
	before_action :ensure_logged_in, except:[:show, :index]
	before_action :load_picture, only: [:show, :edit, :update, :destroy]

	def index
		@pictures = Picture.all
		@most_recent_pictures = Picture.most_recent_five
		@olderpictures = Picture.created_before 1.month.ago
	end

	def show
		@picture = Picture.find(params[:id])
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

	def edit
		@picture= Picture.find(params[:id])
	end

	def update
		@picture=Picture.find(params[:id])
		@picture.title=params[:picture][:title]
		@picture.artist = params[:picture][:artist]
		@picture.url = params[:picture] [:url]
		@picture.created_at = params[:picture] [:date]

		if @picture.save
			redirect_to "/pictures@/#{picture.id}"
		else
			render :edit
		end
	end

	def destroy
		@picture = Picture.find(params[:id])
		@picture.destroy
		redirect_to "/pictures"
	end
end

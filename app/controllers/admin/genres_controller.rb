class Admin::GenresController < ApplicationController
	def index
		@genre =Genre.new
		@gens =Genre.all
	end
	def create
		@genre =Genre.new(gen_params)
		@genre.save
		redirect_to admin_genres_path
	end
	def edit
		@gen =Genre.find(params[:id])
	end
	def update
		@gen =Genre.find(params[:id])
		@gen.update(gen_params)
		redirect_to admin_genres_path
	end
protected
def gen_params
	params.require(:genre).permit(:name,:is_vaild)
	end
end

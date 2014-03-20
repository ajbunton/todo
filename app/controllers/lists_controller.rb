class ListsController < ApplicationController

	before_action :get_list, only: [:show, :edit, :update, :destroy]

	def index
		@lists = List.all
	end

	def show
		@incomplete_tasks = @list.tasks.where(complete: false)
		@complete_tasks = @list.tasks.where(complete: true)
		
		respond_to do |format|
			format.html
			format.js
		end
	end

	def new
		@list = List.new
	end

	def create
		@list = List.new(list_params)
		
		respond_to do |format|
			if @list.save
				format.html {redirect_to @list}
			else
				format.html {render "new"}
			end
		format.js
		end
	end


	def edit
		respond_to do |format|
			format.js
		end
	end

	def update

		respond_to do |format|
			if @list.update_attributes(list_params)
				format.html {redirect_to @list}
				format.js			
			else
				format.html {render "edit"}
			end
			format.js
		end
	end

	def destroy
		@list.destroy
		
		respond_to do |format|
			format.html {redirect_to root_url}
			format.js
		end
	end

	private

	def get_list
		@list = List.find(params[:id])
	end

	def list_params
		params.require(:list).permit(:name)
	end
end
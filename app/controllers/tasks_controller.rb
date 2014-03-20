class TasksController < ApplicationController
	before_action :get_list
	before_action :get_task, only: [:show, :edit, :update, :destroy]

	def index
		@tasks = Task.all
	end

	def show

	end

	def new
		@task = Task.new
	end

	def create
		@task = @list.tasks.new(task_params)
		
		respond_to do |format|
			if @task.save
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
			if @task.update_attributes(task_params)
				redirect_to @list
			else
				render "edit"
			end
			format.js
		end
	end

	def destroy
		@task.destroy

		respond_to do |format|
			format.html {redirect_to @list}
			format.js
		end
	end

	private

	def get_list
		@list = List.find(params[:list_id])
	end

	def get_task
		@task = @list.tasks.find(params[:id])
	end

	def task_params
		params.require(:task).permit(:desc, :complete, :list_id)
	end
end
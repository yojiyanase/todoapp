class TasksController < ApplicationController
    before_action :set_task, only: %i[show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @tasks = Task.all
    end

    def new
        @task = current_user.tasks.build
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
        redirect_to task_path(@task), notice: '保存できたよ'
        else
        flash.now[:error] = '保存に失敗しました'
        render :new
        end
    end

    def show
        @task = current_user.tasks.find(params[:id])
    end

    private

    def task_params
        params.require(:task).permit(:title, :content, :eyecatch)
    end

    def set_task
        @task = Task.find(params[:id])
    end
end
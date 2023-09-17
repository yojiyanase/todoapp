class TasksController < ApplicationController
    before_action :set_task, only: %i[show]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @tasks = Task.all
    end

    def new
        @board = current_user.boards.find(params[:board_id])
        @task = current_user.tasks.build
    end

    def create
        # @board = current_user.boards.find(params[:board_id])
        # @task = @board.tasks.build(task_params)
        board = Board.find(params[:board_id])
        @task = board.tasks.build(task_params)
        if @task.save
          redirect_to board_task_path(board_id: @task.board_id, id: @task.id), notice: '保存できたよ'
        else
          flash.now[:error] = '保存に失敗しました'
          render :new
        end
    end

    def show
        @board = current_user.boards.find(params[:board_id])
        @task = current_user.tasks.find(params[:id])
        @comments = @task.comments
    end

    def edit
        @board = current_user.boards.find(params[:board_id])
        @task = current_user.tasks.find(params[:id])
    end
    
    def update
        @task = current_user.tasks.find(params[:id])
        if @task.update(task_params)
          redirect_to board_task_path(board_id: @task.board_id, id: @task.id), notice: '更新できました'
        else
          flash.now[:error] = '更新できませんでした'
          render :edit
        end
    end
    
    def destroy
        task = current_user.tasks.find(params[:id])
        task.destroy!
        redirect_to root_path, notice: '削除に成功しました'
    end

    private

    def task_params
        params.require(:task).permit(:title, :content, :eyecatch, :limit).merge(user_id:current_user.id, board_id: params[:board_id])
    end

    def set_task
        @task = Task.find(params[:id])
    end
end
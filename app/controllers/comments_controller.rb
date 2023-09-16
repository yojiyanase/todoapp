class CommentsController < ApplicationController
    def new
        # task = Task.find(params[:task_id])
        # @task = task.comments.build
        task = Task.find(params[:task_id])
        @comment = task.comments.build
    end

    def create
        task = Task.find(params[:task_id])
        @comment = task.comments.build(comment_params)
        if @comment.save
          redirect_to board_task_path(task.board, task), notice: 'コメントを追加'
        else
          flash.now[:error] = '更新できませんでした'
          render :new
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:content).merge(user_id:current_user.id)
    end
end
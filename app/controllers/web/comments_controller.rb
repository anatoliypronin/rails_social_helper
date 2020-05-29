# frozen_string_literal: true

class Web::CommentsController < Web::ApplicationController
    def create
      @task = Task.find(params[:task_id])
      @comment = @task.comments.new(comments_params)
      if admin_signed_in?
        @comment[:author_type] = current_admin.class.name
        @comment[:author_id] = current_admin.id
      elsif user_signed_in?
        @comment[:author_type] = current_user.class.name
        @comment[:author_id] = current_user.id
      else
        redirect_to admin_task_path(@task)
      end
      @comment.save
      redirect_to admin_task_path(@task)
    end
  
  
    private
  
    def comments_params
      params.require(:comment).permit(:author_id, :author_type, :body, :task_id)
    end
  end
  
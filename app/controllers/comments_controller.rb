class CommentsController < ApplicationController
  def create
    @event = Snippet.find(params[:snippet_id])
    params[:comment][:user_id] = current_user.id
    params[:comment][:snippet_id] = params[:snippet_id]
    @comment = @event.comments.create!(params[:comment])

    if @comment.save
      redirect_to :back, :notice => "Your comment was successfully posted"
    else
      redirect_to :back, :notice => "Sorry, please try again"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to :back, :notice => "Your comment was successfully deleted"
  end
end

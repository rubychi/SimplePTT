class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    if @comment.like && Comment.liked?(@post.id, current_user.id).size > 0
      redirect_to group_post_path(@group, @post), alert: 'You already liked the post.'
    elsif @comment.dislike && Comment.disliked?(@post.id, current_user.id).size > 0
      redirect_to group_post_path(@group, @post), alert: 'You already disliked the post.'
    elsif @comment.save
      @group = Group.find(params[:group_id])
      redirect_to group_post_path(@group, @post)
    else
      redirect_to group_post_path(@group, @post), alert: 'omment failed to post.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :like, :dislike)
  end
end

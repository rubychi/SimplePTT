class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_post_and_check_permission, only: [:edit, :update, :destroy]

  def show
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
  end

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user
    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
    session[:redirect_url] = request.referrer
  end

  def update
    if @post.update(post_params)
      redirect_to session[:redirect_url], notice: '更新成功！'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:alert] = '成功刪除！'
    redirect_to request.referrer
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post_and_check_permission
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    if current_user != @post.user && current_user != @group.user
      redirect_to root_path, alert: '你沒有權限喔！'
    end
  end
end

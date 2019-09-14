class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_group_and_check_permission, only: [:edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts.recent.paginate(page: params[:page], per_page: 5)
  end

  def edit; end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      current_user.join!(@group)
      redirect_to groups_path
    else
      render :new
    end
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    flash[:alert] = 'Successfully deleted.'
    redirect_to groups_path
  end

  def join
    @group = Group.find(params[:id])

    if !current_user.member_of?(@group)
      current_user.join!(@group)
      flash[:notice] = 'Successfully Joined.'
    else
      flash[:warning] = 'You are already a member.'
    end

    redirect_to group_path(@group)
  end

  def leave
    @group = Group.find(params[:id])

    if current_user.member_of?(@group)
      current_user.leave!(@group)
      flash[:notice] = 'Successfully Left.'
    else
      flash[:warning] = 'You are not a member.'
    end

    redirect_to group_path(@group)
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end

  def find_group_and_check_permission
    @group = Group.find(params[:id])
    if current_user != @group.user
      redirect_to root_path, alert: 'You do not have permission.'
    end
  end
end

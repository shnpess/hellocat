class GroupsController < ApplicationController

  def index
    @post = current_user
  end


  def create
    post = Post.find(params[:post_id])
    group = Group.create(name: "#{current_user.nickname}さんと#{post.user.nickname}さんのチャット", post_id:(params[:post_id]),  user_ids: [current_user.id, post.user.id])
    redirect_to post_group_messages_path(post.id, group.id)
  end
end

private
  def post_params
    params.require(:group).permit(:name).merge(user_id: current_user.id)
  end
class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
end

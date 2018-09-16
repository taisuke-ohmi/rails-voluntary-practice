class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save 
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end

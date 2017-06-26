class SubsController < ApplicationController
before_action :ensure_logged_in, except: [:show, :index]
before_action :ensure_moderator, only: [:update, :destroy]

  def new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = current_user.subs.find(params[:id])

  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
  end

  def destroy
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end

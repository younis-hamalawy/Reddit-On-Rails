class SubsController < ApplicationController
before_action :ensure_logged_in, except: [:show, :index]
before_action :ensure_moderator, only: [:edit, :update, :destroy]

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
  end

  def update
    # @sub = current_user.subs.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
  end

  def destroy
    @sub.destroy
    redirect_to subs_url
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def ensure_moderator
    @sub = Sub.find(params[:id])
    redirect_to sub_url(@sub) unless current_user.id == @sub.moderator.id
  end
end

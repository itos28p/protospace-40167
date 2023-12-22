class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :new, :edit, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototype = Prototype.all
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    
    if @prototype.save
      redirect_to "/prototypes", notice: 'Prototype was successfully created.'
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    @prototype.update(prototype_params)
    redirect_to prototype_path
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end
end

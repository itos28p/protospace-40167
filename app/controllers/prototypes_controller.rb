class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :new, :edit, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.all
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
    @prototype = current_user.prototypes.build(prototype_params)
    
    if @prototype.save
      redirect_to prototypes_path, notice: 'Prototype was successfully created.'
    else
      render :new
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end
end

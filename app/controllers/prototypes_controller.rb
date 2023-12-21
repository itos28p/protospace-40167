class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :new, :edit, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end
end

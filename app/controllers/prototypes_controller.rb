class PrototypesController < ApplicationController
  
  before_action :authenticate_user!, except: [:index,:show]

  
  

  def index
    @prototypes = Prototype.all
  end


  def new
    @prototype = Prototype.new
  end


  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
    redirect_to root_path if current_user.id != @prototype.user.id
  end

  def update
      prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
       redirect_to prototype_path(prototype.id)
    else
      render "prototypes/edit"
    end 
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    render :new
  end


  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  private 

  def prototype_params
      params.require(:prototype).permit(:catch_copy, :concept, :image, :title).merge(user_id: current_user.id)
  end

 




end

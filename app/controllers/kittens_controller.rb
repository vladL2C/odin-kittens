class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.xml { render :xml => @kittens }
      format.json { render :json => @kittens }
    end   
  end 

  def new
    @kitten = Kitten.new
  end 

  def create
    @kitten = Kitten.new(kitten_params) 
    if @kitten.save
      flash[:success] = "You created a new kitten"
      redirect_to kitten_url(@kitten)
    else 
      flash.now[:danger] = "You fucked up"
      render :new
    end 
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end 

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html 
      format.xml { render xml: @kitten }
      format.json { render json: @kitten }
    end 
  end  

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "updated details"
      redirect_to root_url
    else 
      flash.now[:danger] = "You fucked up"
      render :edit 
    end   
  end 

  def destroy
    @kitten = Kitten.find(params[:id]).destroy
    flash[:success] = "deleted kitten"
    redirect_to root_url
  end

  private
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end  
end

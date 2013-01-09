class WishesController < ApplicationController
  def index
    @wishes = User.find(params[:user_id]).wishes
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wishes }
    end
  end

  def show
    @wish = Wish.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wish }
    end
  end

  def new
    @wish = Wish.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wish }
    end
  end

  def edit
    @wish = Wish.find(params[:id])
  end


  def create
    @wish = Wish.new(params[:wish])
    @wish.user_id = params[:user_id]
    respond_to do |format|
      if @wish.save
        format.html { redirect_to user_path(@wish.user_id); flash[:"alert alert-success"]= "Deseo realizado" }
        format.json { render json: @wish, status: :created, location: @wish }
      else
        format.html { render action: "new" }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @wish = Wish.find(params[:id])

    respond_to do |format|
      if @wish.update_attributes(params[:wish])
        format.html { redirect_to user_path(@wish.user_id); flash[:"alert alert-success"]= "Deseo Actualizado" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wish.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy

    respond_to do |format|
      format.html { redirect_to user_path(@wish.user_id) }
      format.json { head :no_content }
    end
  end
end

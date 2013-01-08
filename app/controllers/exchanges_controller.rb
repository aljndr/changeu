class ExchangesController < ApplicationController
	def new
		@exchange = Exchange.new
	end

	def create
		user_id = params[:user_id]
		@exchange = Exchange.new(params[:exchange])
		respond_to do |format|
	      if @exchange.save
	      	UserExchange.create user_id: user_id,exchange_id: @exchange.id
	        format.html { redirect_to user_path(user_id), notice: 'Intercambio generado' }
        	format.json { render json: @exchange, status: :created, location: @exchange }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @exchange.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def edit
		@exchange = Exchange.find(params[:id])
	end

	def update
	    @exchange  = Exchange.find(params[:id])

	    respond_to do |format|
	      if @exchange.update_attributes(params[:exchange])
	        format.html { redirect_to user_path(params[:user_id]), notice: 'Exchange was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @exchange.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	def destroy
  		@exchange  = Exchange.find(params[:id])
  		@exchange.destroy
  		respond_to do |format|
	      format.html { redirect_to user_path(params[:user_id]) }
	      format.json { head :no_content }
	    end
  	end

end

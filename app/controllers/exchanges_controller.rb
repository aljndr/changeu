class ExchangesController < ApplicationController
	def new
		@exchange = Exchange.new
	end

	def create
		user_id = params[:user_id]
		@exchange = Exchange.new(params[:exchange])
		respond_to do |format|
	      if @exchange.save
	      	UserExchange.create user_id: user_id,exchange_id: @exchange.id,status:1
	        format.html { redirect_to user_path(user_id); flash[:"alert alert-success"]= 'Intercambio generado' }
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
	        format.html { redirect_to user_path(params[:user_id]); flash[:"alert alert-success"]= "Intercambio Actualizado" }
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

  	def participantes
  		@exchanging  = Exchange.find(params[:exchange_id]).users
  	end

  	def invitar
  		@exchange = Exchange.find(params[:exchange_id])
  		@invitado = User.find_by_usuario params[:invitado][:usuario]
  		if @invitado.nil?
  			flash[:"alert alert-warning"]= "El usuario no existe"
  		else	
	  		@ue = UserExchange.find_or_create_by_user_id_and_exchange_id user_id: @invitado.id,exchange_id: @exchange.id
	 		@ue.status=2
	 		@ue.save
	 		flash[:"alert alert-success"]= "Ha sido invitado " + @invitado.usuario 	
	 	end
		redirect_to exchange_participantes_path  @exchange.id
  	end

  	def aceptar
  		ue = UserExchange.find_by_user_id_and_exchange_id session[:user],params[:exchange_id]
  		ue.status = 3
  		if ue.save
  			flash[:"alert alert-success"]= "Invitacion Aceptada"
  		else
  			flash[:"alert alert-error"]= "La Invitacion no pudo ser Aceptada intentelo de nuevo"
  		end
  		redirect_to user_path(session[:user])  		
  	end

  	def rechazar
  		ue = UserExchange.find_by_user_id_and_exchange_id session[:user],params[:exchange_id]
  		ue.destroy
  		redirect_to user_path(session[:user])  
  	end

  	def sacar
  		ue = UserExchange.find_by_user_id_and_exchange_id params[:exchanging],params[:exchange_id]
  		ue.destroy
  		redirect_to exchange_participantes_path(params[:exchange_id])
  	end

  	def sortear
  		us = {}  
  		rdy = []
  		flg = true
  		flash[:"alert alert-success"] = "sss "
  		e = Exchange.find params[:exchange_id] 		
  		
  		while flg
  			flg = false 
  			us = {}  
  			rdy = []
	  		e.users.each {|u| 
	  			us[u.id] = (e.users.pluck("users.id")-[u.id]-rdy).shuffle[0]
	  			rdy << us[u.id]
	  			flg=true if us[u.id].nil?
	  		}

	  	end

	  	us.each{ |id,ex_id|
	  		ue =  UserExchange.find_by_user_id_and_exchange_id id,params[:exchange_id]
	  		ue.exchanging_id = ex_id
	  		ue.save
	  	}

	  	flash[:"alert alert-success"] = "Sorteo finalizado"
  		
  		redirect_to exchange_participantes_path(params[:exchange_id])
  	end

end

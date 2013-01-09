class WebTabsController < ApplicationController
	def home
	end

	def login
	end

	def logout
		session[:user]=nil
		redirect_to root_path
	end

	def verify
		u = User.find_by_usuario params[:session][:usuario]
		if u.nil? 
			flash[:"alert alert-error"]= "Usuario o Password no valido"
			render :login
			nil 
		elsif u.password != params[:session][:password]
			flash[:"alert alert-error"]= "Usuario o Password no valido"
			render :login
		else
			session[:user]=u.id
			redirect_to user_path(u.id)
		end
	end
end

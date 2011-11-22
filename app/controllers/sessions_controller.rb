#encoding: utf-8
class SessionsController < ApplicationController
  def new
    @usuario = Usuario.new
    render :action => 'new'
  end

  def create #login
    @usuario = Usuario.autenticar(
            params[:usuario][:email],
            params[:usuario][:senha])

    if @usuario
      self.usuario_atual = @usuario
      flash[:success] = "Login efetuado com sucesso!"
      redirect_to produtos_url
    else
      flash.now[:error] = "Nao foi possível realizar o seu login com os dados enviados"
      new
    end
  end

  def destroy #logout
    reset_session
    flash[:success] = "Você saiu da aplicaçao!"
    redirect_to produtos_url
  end

end
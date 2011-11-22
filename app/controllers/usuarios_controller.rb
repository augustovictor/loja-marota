#encoding: utf-8
class UsuariosController < ApplicationController

  def new #mostra o formulario para criar um usuario
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new( params[:usuario] ) #cria o usuario com os dados passados
    if @usuario.save #tenta salvar
      self.usuario_atual = @usuario
      flash[:success] = 'Seu usuário foi criado com sucesso!'
      redirect_to produtos_url

    else #se nao salvar, renderiza um new
      render :action => 'new'
    end
  end

end
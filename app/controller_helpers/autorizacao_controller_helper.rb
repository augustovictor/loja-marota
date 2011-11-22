module AutorizacaoControllerHelper

  def self.included( base )
    base.helper_method :usuario_atual, :logged_in? #este metodo pode ser chamado nas views
  end

  protected

  def logged_in?
    self.usuario_atual
  end

  def usuario_atual
    if @usuario_atual.nil? && !session[:usuario_id].blank? #se estiver nil e houver um usuario_id na sessao
      @usuario_atual = Usuario.find( session[:usuario_id] ) #coloca esse usuario nesta variavel
    end

    @usuario_atual #carrega o usuario

  end

  def usuario_atual=( novo_usuario )
    session[:usuario_id] = novo_usuario.id
    @usuario_atual = novo_usuario
  end

end
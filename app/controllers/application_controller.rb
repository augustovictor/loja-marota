class ApplicationController < ActionController::Base
  protect_from_forgery

  include AutorizacaoControllerHelper #metodos disponiveis no AutorizacaoControllerHelper estao disponiveis aqui

  helper_method :pedido_atual

  before_filter :selecionar_lingua

  protected #definir método como protected ou private, quando nao for uma açao

  def selecionar_lingua
    I18n.locale = session[:lingua] ||= 'pt-BR' #caso a lingua ja esteja
=begin
    I18n.current_locale = if session[:lingua].blank?
                            'pt-br'
                          else
                            session[:lingua]
                          end
=end
  end

  def pedido_atual

    @pedido_atual ||= if !session[:pedido_id].blank? #||= executa os comandos seguintes caso a variavel seja vazia

      Pedido.find( session[:pedido_id] )

    else
      Pedido.new
    end

  end

  def carregar_pagina
    @page = params[:page] || 1
    @per_page = params[:per_page] || 10
  end

  def paginate( scope )
    carregar_pagina
    scope.paginate( :per_page => @per_page, :page => @page )
  end

end

class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :pedido_atual

  protected #definir método como protected ou private, quando nao for uma açao

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

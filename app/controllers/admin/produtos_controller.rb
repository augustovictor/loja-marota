class Admin::ProdutosController < Admin::BaseController

  before_filter :load_produto, :only => [:new, :edit, :create, :update, :destroy] #antes de executar os metodos descritos, executar load_produto

  def index
    carregar_pagina
    @produtos = paginate( Produto )
  end

  def new
    render :action => 'new'
  end

  alias :edit :new #quando chamar edit, chamar new

  def create
    if @produto.update_attributes( params[:produto] )
      flash[:success] = 'Produto criado/atualizado com sucesso!' #exibe mensagem
      redirect_to admin_produtos_url #redireciona para url
    else
      new
    end
  end

  alias :update :create

  protected

  def load_produto
    @produto = params[:id].blank? ? Produto.new : Produto.find( params[:id] )
  end

end
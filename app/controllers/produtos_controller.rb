class ProdutosController <ApplicationController

  def index
    @produtos = Produto.all

    respond_to do | format | #seleciona o tipo do conteudo que vai ser entregue ao browser. Default .html
      format.html
      format.json { render :json => @produtos }
      format.xml { render :xml => @produtos }
      #prown para enviar pdf
    end

  end

  def show
    @produto = Produto.find(params[:id])
  end

end
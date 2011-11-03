module Admin::ProdutosHelper

  def admin_produto_form( produto, &block ) #ultimo elemento dos parametros + '&'. Indica o bloco do form inteiro
    result = if produto.new_record?
              [ admin_produtos_url, :post ]
             else
              [ admin_produto_url( produto ), :put ]
             end

    form_for( produto, :url => result.first,
              :method => result.last,
              :builder => BootstrapFormBuilder,
              &block )
  end

end
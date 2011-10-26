class Pedido < ActiveRecord::Base

  has_many :itens #, :class_name => 'Item', :foregin_key => :pedido_id #possui :itens has_many ou has_one
  has_many :produtos, :through =>:itens

  def adicionar_produto( produto, quantidade )

    if item = self.itens.detect { | item | item.produto == produto }

      item.incrementar_quantidade( quantidade )
      item.save

    else

      self.itens.create( :produto_id => produto.id, :quantidade => quantidade )

    end

  end

  def preco_total

    self.itens.inject( 0 ) do | acumulado, item |   #inject soma ou acumula um objeto dentro de um array

      acumulado + item.preco_total

    end

  end

end
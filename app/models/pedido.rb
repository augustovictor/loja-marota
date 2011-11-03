class Pedido < ActiveRecord::Base

  has_many :itens, :dependent => :destroy #, :class_name => 'Item', :foregin_key => :pedido_id #possui :itens has_many ou has_one
  accepts_nested_attributes_for :itens
  has_many :produtos, :through =>:itens

  before_validation :remover_itens_invalidos

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

  def remover_itens_invalidos
    itens_invalidos = self.itens.find_all do |item|
    item.invalid?
    #itens_invalidos = self.itens.find_all(&:invalid?)
    end
    self.itens.delete( * itens_invalidos )
  end

end
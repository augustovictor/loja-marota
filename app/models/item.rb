class Item << ActiveRecord::Base
  belongs_to :pedido  #pertence a :pedido
  belongs_to :produto

  validates_presence_of :pedido_id, :produto_id, :quantidade
  validates_numericaly_of :quantidade, :only_integer => true, :greater_than => 0
end
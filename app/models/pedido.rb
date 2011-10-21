class Pedido < ActiveRecord::Base

  has_many :itens #, :class_name => 'Item', :foregin_key => :pedido_id #possui :itens has_many ou has_one
  has_many :produtos, :through =>:itens

end
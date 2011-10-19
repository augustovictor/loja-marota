class CriarProdutos < ActiveRecord::Migration
  def up
    create_table :produtos do |t|
      t.string :nome, :null => false
      t.text :descricao #null = true default
      t.decimal :preco, { #chave opcional
          :precision => 10, #quantidade de caracteres numericos
          :scale => 2, #duas casas decimais apos a virgula
          :null => false
      }
      t.timestamps #hora de criacao de dado e finalizacao dado
    end
    #create_table
  end

  def down
    drop_table :produtos
  end
end

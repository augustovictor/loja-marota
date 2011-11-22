#encoding: utf-8
#testes sao feitos fazendo uma comparacao entre valores utiliando o should be_true, por ex.
require File.join(File.dirname(__FILE__), '..', 'spec_helper') #cabecalho obrigatorio

describe Usuario do #para quem serao os testes (classe do objeto)

  context 'quando estiver validando senhas' do #Define como sera validada a senha

    it 'deve requerer senha se senha_em_hash estiver vazio' do

      @usuario = Usuario.new
      @usuario.senha_necessaria?.should be_true #define que o retorno de senha_necessaria? deve ser true

    end

    it 'nao deve requerer senha se senha_em_hash estiver preenchido' do

      @usuario = Usuario.new( :senha_em_hash => 'minhasenha' )
      @usuario.senha_necessaria?.should be_false

    end

    it 'deve requerer senha se senha_em_hash e senha estiverem preenchidas' do

      @usuario = Usuario.new( :senha => 'minhasenha', :senha_em_hash => 'minhasenha' )
      @usuario.senha_necessaria?.should be_true

    end

  end

  context 'ao validar senhas' do

      before :each do #antes de entrar em it pedaco de codigo para teste, executar este bloco

        @senha = '123456'
        @usuario = Usuario.new(
          :nome => 'test user',
          :email => 'email@gmail.com',
          :senha => @senha
        )

        @usuario.termos_e_condicoes = '1'
        @usuario.save!

      end

      it 'deve validar como senha correta' do

        @senha_final = Usuario.hashear_senha( @senha, @usuario.salt )
        @senha_final.should == @usuario.senha_em_hash

      end

    it 'deve aceitar a senha do usuario com email' do

      @outro_usuario = Usuario.autenticar(
        @usuario.email, @senha
      )

      @outro_usuario.should == @usuario

    end

    it 'nao deve aceitar a senha do usuario se ela for invalida' do

      @outro_usuario = Usuario.autenticar(
        @usuario.email, "098765"
      )

      @outro_usuario.should be_nil

    end

    it 'nao deve aceitar a senha do usuario quando o email nao exister' do
      @outro_usuario = Usuario.autenticar( 'fake@email.com', "098765" )
      @outro_usuario.should be_nil
    end

  end
  #context 'ao validar senhas'

end
#encoding:utf-8
module ControllerGeneratorHelper

  def self.included( clazz )
    clazz.extend( ControllerGeneratorHelper::ClassMethods )
  end

  module ClassMethods

    def gerar_controller( clazz )
      singular = clazz.name.underscore
      plural = clazz.name.underscore.pluralize

      index = %Q!

        def index
          @#{plural} = paginate( #{clazz.name} )
        end

        before_filter :load_#{singular}, :only => [:new, :edit, :create, :update, :destroy] #antes de executar os metodos descritos, executar load_produto


          def new
            render :action => 'new'
          end

          alias :edit :new #quando chamar edit, chamar new

          def create
            if @#{singular}.update_attributes( params[:#{singular}] )
              flash[:success] = '#{clazz.model_name.human} criado/atualizado com sucesso\!' #exibe mensagem
              redirect_to admin_#{plural}_url #redireciona para url
            else
              new
            end
          end

          alias :update :create

          protected

          def load_#{singular}
            @#{singular} = params[:id].blank? ? #{clazz.name}.new : #{clazz.name}.find( params[:id] )
          end

      !

      class_eval index

    end

  end

end
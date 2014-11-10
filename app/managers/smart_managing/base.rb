module SmartManaging
  class Base
    attr_accessor :controller

    def initialize(controller)
      @controller = controller
    end

    def number_of_attributes
      attributes.size
    end

    def permitted_params
      klass.columns.map(&:name)
    end

    def attributes
      klass.columns.map {|column| standardize(column.name)}
    end

    def klass
      controller_name.classify.constantize
    end

    def editable_attributes
      attributes - SmartManaging::UNEDITABLE_ATTRIBUTES
    end

    def model_sym
      controller_name.to_s.singularize.to_sym
    end

    private

    def controller_name
      controller.controller_name
    end

    def standardize(column)
      column.gsub(/_id$/, '')
    end
  end
end

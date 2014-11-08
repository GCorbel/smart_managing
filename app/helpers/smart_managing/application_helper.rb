module SmartManaging
  module ApplicationHelper
    delegate :attributes, :editable_attributes, :number_of_attributes,
      to: :manager

    def colspan
      number_of_attributes + 1
    end

    def resource_name
      controller_name.to_sym
    end

    def new_item_path
      new_polymorphic_path(klass)
    end

    private

    def klass
      controller_name.classify.constantize
    end

    def resource_name
      controller_name.to_sym
    end

    def singular_resource_name
      resource_name.to_s.singularize.to_sym
    end
  end
end

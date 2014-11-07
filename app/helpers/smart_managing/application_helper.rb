module SmartManaging
  module ApplicationHelper
    def number_of_attributes
      attributes.size
    end

    def colspan
      number_of_attributes + 1
    end

    def attributes
      klass.columns.map(&:name)
    end

    def editable_attributes
      attributes - SmartManaging::UNEDITABLE_ATTRIBUTES
    end

    def resource_name
      controller_name.to_sym
    end

    def view_item_path
      "#{controller_path}/#{singular_resource_name}"
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

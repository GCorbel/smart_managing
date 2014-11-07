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

    private

    def klass
      controller_name.classify.constantize
    end
  end
end

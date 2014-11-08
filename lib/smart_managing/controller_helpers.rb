module SmartManaging
  module ControllerHelpers

    def index
      smart_listing_create partial: 'list'
      respond_to do |format|
        format.html { render formats: :html }
        format.js { render formats: :js }
      end
    end

    private

    def self.included(c)
      return unless c < ActionController::Base
      c.helper_method :editable_attributes
      c.include SmartListing::Helper::ControllerExtensions
      c.helper  SmartListing::Helper
      c.respond_to :html, :js
    end

    def _prefixes
      super << 'smart_managing'
    end

    def build_resource_params
      [params.fetch(model_sym, {}).permit(attributes)]
    end

    def model_sym
      controller_name.to_s.singularize.to_sym
    end

    def klass
      controller_name.classify.constantize
    end

    def attributes
      klass.columns.map(&:name)
    end

    def editable_attributes
      attributes - SmartManaging::UNEDITABLE_ATTRIBUTES
    end
  end
end

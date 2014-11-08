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
      c.helper_method :manager
      c.include SmartListing::Helper::ControllerExtensions
      c.helper  SmartListing::Helper
      c.respond_to :html, :js
    end

    def manager
      @manager ||= manager_class.new(self)
    end

    def manager_class
      custom_class? ? custom_class : SmartManaging::Base
    end

    def custom_class?
      Object.const_defined?(custom_manager_name)
    end

    def custom_class
      custom_manager_name.constantize
    end

    def custom_manager_name
      "#{controller_name.classify}Manager"
    end

    def _prefixes
      super << 'smart_managing'
    end

    def build_resource_params
      [params.fetch(manager.model_sym, {}).permit(manager.attributes)]
    end
  end
end

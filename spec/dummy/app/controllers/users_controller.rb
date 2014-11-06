class UsersController < InheritedResources::Base
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  respond_to :html, :js

  def index
    smart_listing_create partial: "users/list"
    respond_to do |format|
      format.html { render formats: :html }
      format.js { render formats: :js }
    end
  end

  def change_name
    resource.update_attribute('name', 'Changed Name')
    render 'update'
  end

  private

  def build_resource_params
    [params.fetch(:user, {}).permit(:name, :email)]
  end
end

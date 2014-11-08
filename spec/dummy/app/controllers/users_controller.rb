class UsersController < InheritedResources::Base
  include SmartManaging::ControllerHelpers
  def change_name
    resource.update_attribute('name', 'Changed Name')
    render 'update'
  end
end

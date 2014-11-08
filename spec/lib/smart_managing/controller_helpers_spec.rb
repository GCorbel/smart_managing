require 'rails_helper'

describe UsersController do
  describe '#editable_attributes' do
    it 'give editable attributes of the model' do
    controller = UsersController.new
    expected = ['name', 'email']
    expect(controller.send(:editable_attributes)).to eq expected
    end
  end

  describe '#build_resource_params' do
    it 'filter the params' do
      controller = UsersController.new
      params = ActionController::Parameters.new({
        "commit" => "Save",
        "user" => {
          "name" => "name",
          "email" => "email",
          "firstname" => "firstname"
        }
      })
      allow(controller).to receive(:params).and_return(params)

      expected = [{"name" => "name", "email" => "email"}]

      expect(controller.send(:build_resource_params)).to eq expected
    end
  end
end

require 'rails_helper'

describe UsersController do
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

  describe '#manager' do
    context 'when there is a specific management class' do
      before do
        class UserManager; end;
      end

      after do
        Object.send(:remove_const, :UserManager)
      end

      it 'give the specific management class' do
        controller = UsersController.new
        manager = double

        allow(UserManager).to receive(:new).and_return(manager)

        expect(controller.send(:manager)).to eq manager
      end
    end
  end
end

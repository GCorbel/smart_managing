require 'rails_helper'

describe SmartManaging::Base do
  describe '#number_of_attributes' do
    it 'give the number of attributes' do
      manager = build_manager
      expect(manager.number_of_attributes).to eq 6
    end
  end

  describe '#attributes' do
    it 'give all attributes of the model' do
      manager = build_manager
      expected = ['id', 'name', 'email', 'group', 'created_at', 'updated_at']
      expect(manager.attributes).to eq expected
    end
  end

  describe '#permitted_params' do
    it 'give the column name of the model' do
      manager = build_manager
      expected = ['id', 'name', 'email', 'group_id', 'created_at',
                  'updated_at']
      expect(manager.permitted_params).to eq expected
    end
  end

  describe '#editable_attributes' do
    it 'give editable attributes of the model' do
      manager = build_manager
      expected = ['name', 'email', 'group']
      expect(manager.editable_attributes).to eq expected
    end
  end

  describe '#model_sym' do
    it 'give the model name to sym' do
      manager = build_manager
      expect(manager.model_sym).to eq :user
    end
  end

  def build_manager
    controller = UsersController.new
    SmartManaging::Base.new(controller)
  end
end

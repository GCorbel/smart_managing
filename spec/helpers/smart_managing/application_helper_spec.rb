require 'rails_helper'

describe ApplicationHelper do
  include ApplicationHelper
  describe '#number_of_attributes' do
    it 'give the number of attributes' do
      expect(helper).to receive(:controller_name).and_return('users')
      expect(helper.number_of_attributes).to eq 5
    end
  end

  describe '#colspan' do
    it 'give the normal colspan' do
      expect(helper).to receive(:controller_name).and_return('users')
      expect(helper.colspan).to eq 6
    end
  end

  describe '#attributes' do
    it 'give all attributes of the model' do
      expect(helper).to receive(:controller_name).and_return('users')
      expected = ['id', 'name', 'email', 'created_at', 'updated_at']
      expect(helper.attributes).to eq expected
    end
  end

  describe '#editable_attributes' do
    it 'give editable attributes of the model' do
      expect(helper).to receive(:controller_name).and_return('users')
      expected = ['name', 'email']
      expect(helper.editable_attributes).to eq expected
    end
  end

  describe '#new_item_path' do
    it 'give the path to the new item form' do
      expect(helper).to receive(:controller_name).and_return('users')
      expect(helper.new_item_path).to eq '/users/new'
    end
  end
end

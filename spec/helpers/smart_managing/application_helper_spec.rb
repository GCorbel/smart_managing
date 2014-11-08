require 'rails_helper'

describe ApplicationHelper do
  include ApplicationHelper
  describe '#colspan' do
    it 'give the normal colspan' do
      manager = double(number_of_attributes: 5)
      allow(helper).to receive(:manager).and_return(manager)
      expect(helper.colspan).to eq 6
    end
  end

  describe '#new_item_path' do
    it 'give the path to the new item form' do
      expect(helper).to receive(:controller_name).and_return('users')
      expect(helper.new_item_path).to eq '/users/new'
    end
  end
end

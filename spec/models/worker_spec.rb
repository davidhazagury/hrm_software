require 'rails_helper'

RSpec.describe Worker, type: :model do
  context 'workers validations for mandatory presence' do
    it 'ensures first name presence' do
      worker = Worker.new(last_name: 'Last').save
      expect(worker).to eq(false)
    end
    it 'ensures last name presence' do
      worker = Worker.new(first_name: 'Test').save
      expect(worker).to eq(false)
    end
    it 'ensures birth date presence' do
      worker = Worker.new(first_name:'First', last_name:'Last').save
      expect(worker).to eq(false)
    end
  end
end

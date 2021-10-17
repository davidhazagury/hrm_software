require 'rails_helper'

RSpec.describe Sick, type: :model do
  context 'Validations for Sick Leaves' do
    it 'ensures workers id presence' do
      # We want .save to return false => This is means the instance hasn't being saved
      sick = Sick.new().save
      # we force sick to not have a worker_id, it's returning red because,
      # our expectation hasn't been fullfield. (It woud've saved the instance)
      expect(sick).to eq(false)
      # We fixed it by creating the relationship has_many / belong_to in their models
    end
  end
end

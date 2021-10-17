require 'rails_helper'

RSpec.describe Sick, type: :model do
  context 'Validations for Sick Leaves' do
    it 'ensures start date of sick leave' do
      # We want .save to return false => This is means the instance hasn't being saved
      sick = Sick.new().save
      expect(sick).to eq(false)
    end
    it 'ensures rejoin date of sick leave' do
      # We want .save to return false => This is means the instance hasn't being saved
      sick = Sick.new(start_date_sickness:'2020-01-20').save
      expect(sick).to eq(false)
    end
    it 'ensures sick has a comment' do
      sick = Sick.new(start_date_sickness:'2020-01-20', rejoin_date_sickness: '2020-10-01').save
      expect(sick).to eq(false)
    end
    it 'ensures workers id presence' do
      # We want .save to return false => This is means the instance hasn't being saved
      sick = Sick.new(start_date_sickness:'2020-01-20', rejoin_date_sickness: '2020-10-01', comment:'Test with minimun letters').save
      # we force sick to not have a worker_id, it's returning red because,
      # our expectation hasn't been fullfield. (It woud've saved the instance)
      expect(sick).to eq(false)
      # We fixed it by creating the relationship has_many / belong_to in their models
    end
  end
end

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'Validations for Company Model' do
    context 'When creating a new company' do
      it 'ensures the new company has a name' do
        company = Company.new(name_of_company: nil).save
        # We don't want to save the company instance => .save must return false (it will return true if company is saved)
        expect(company).to eq(false)
      end
      it 'ensures the new company has a contact first name' do
        company = Company.new(name_of_company: 'Test Company', first_name_company_contact: nil).save
        expect(company).to eq(false)
      end
      it 'ensures the new company has a contact last name' do
        company = Company.new(name_of_company: 'Test Company', first_name_company_contact: 'FirstName', last_name_company_contact: nil).save
        expect(company).to eq(false)
      end
      it 'ensures the new company has a contact email' do
        company = Company.new(name_of_company: 'Test Company', first_name_company_contact: 'FirstName', last_name_company_contact: 'LastName', email_company_contact: nil).save
        expect(company).to eq(false)
      end
      it 'ensures the new company has number of employes' do
        company = Company.new(name_of_company:'Test', first_name_company_contact: 'FirstName', last_name_company_contact: 'LastName', email_company_contact: 'EmailCompany', number_of_employees_company: nil).save
        expect(company).to eq(false)
      end
      it 'ensures number of employes only accepts integers' do
        company = Company.new(name_of_company:'Test', first_name_company_contact: 'FirstName', last_name_company_contact: 'LastName', email_company_contact: 'EmailCompany', number_of_employees_company: 'Test').save
        expect(company).to eq(false)
      end
      it 'ensures phone number only accepts integers' do
        company = Company.new(name_of_company:'Test', first_name_company_contact: 'FirstName', last_name_company_contact: 'LastName', email_company_contact: 'EmailCompany', number_of_employees_company: 6, phone_company_contact: 'Phone').save
        expect(company).to eq(false)
      end
    end
  end
end

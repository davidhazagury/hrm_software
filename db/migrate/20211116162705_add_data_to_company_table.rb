class AddDataToCompanyTable < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :first_name_company_contact, :string
    add_column :companies, :last_name_company_contact, :string
    add_column :companies, :email_company_contact, :string
    add_column :companies, :phone_company_contact, :string
    add_column :companies, :number_of_employees_company, :integer
  end
end

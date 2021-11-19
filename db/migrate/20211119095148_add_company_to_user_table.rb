class AddCompanyToUserTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :company, foreign_key: true
    change_column_default(:workers, :company_id, nil)
  end
end

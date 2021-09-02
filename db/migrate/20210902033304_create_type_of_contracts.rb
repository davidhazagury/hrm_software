class CreateTypeOfContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :type_of_contracts do |t|
      t.string :name_type_of_contract

      t.timestamps
    end
  end
end

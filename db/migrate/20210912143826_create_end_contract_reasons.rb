class CreateEndContractReasons < ActiveRecord::Migration[6.0]
  def change
    create_table :end_contract_reasons do |t|
      t.string :name_of_end_reason

      t.timestamps
    end
  end
end

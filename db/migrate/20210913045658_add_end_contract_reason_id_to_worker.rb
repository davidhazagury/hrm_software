class AddEndContractReasonIdToWorker < ActiveRecord::Migration[6.0]
  def change
    add_reference :workers, :end_contract_reason, foreign_key: true
  end
end

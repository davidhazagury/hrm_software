class CreateSicks < ActiveRecord::Migration[6.0]
  def change
    create_table :sicks do |t|

      t.timestamps
    end
  end
end

class AddTypeOfSickToSicks < ActiveRecord::Migration[6.0]
  def change
    add_column :sicks, :type_of_sickness, :string
  end
end

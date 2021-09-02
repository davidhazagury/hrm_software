class CreateWorkCenters < ActiveRecord::Migration[6.0]
  def change
    create_table :work_centers do |t|
      t.string :name_of_work_center

      t.timestamps
    end
  end
end
